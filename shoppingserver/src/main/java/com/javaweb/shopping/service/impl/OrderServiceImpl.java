package com.javaweb.shopping.service.impl;

import com.javaweb.shopping.entity.*;
import com.javaweb.shopping.mapper.*;
import com.javaweb.shopping.service.OrderService;
import com.javaweb.shopping.utils.PageHelper;
import com.javaweb.shopping.vo.ResStatus;
import com.javaweb.shopping.vo.ResultVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.util.Sqls;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.*;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private ShoppingCartMapper shoppingCartMapper;
    @Autowired
    private OrdersMapper ordersMapper;
    @Autowired
    private OrderItemMapper orderItemMapper;
    @Autowired
    private ProductSkuMapper productSkuMapper;
    @Autowired
    private ProductMapper productMapper;
    private Logger logger = LoggerFactory.getLogger(OrderServiceImpl.class);

    /**
     * 保存订单业务
     */
    @Override
    @Transactional
    public List<Map<String, String>> addOrder(String cids, Orders order) throws SQLException {
        logger.info("add order begin...");
        List<Map<String, String>> mapList = new ArrayList<>();
        Map<String, List<ShoppingCartVO>> shopMap = new HashMap<>();
        //1.校验库存：根据cids查询当前订单中关联的购物车记录详情（包括库存）
        String[] arr = cids.split(",");
        List<Integer> cidsList = new ArrayList<>();
        for (String s : arr) {
            cidsList.add(Integer.parseInt(s));
        }
        List<ShoppingCartVO> list = shoppingCartMapper.selectShopcartByCids(cidsList);
        //获取购物车中所有shopId，加入map
        for (ShoppingCartVO sc : list) {
            Example example = new Example(Product.class);
            Example.Criteria criteria = example.createCriteria();
            criteria.andEqualTo("productId", sc.getProductId());
            List<Product> products = productMapper.selectByExample(example);
            shopMap.computeIfAbsent(products.get(0).getShopID(), k -> new ArrayList<>());
            shopMap.get(products.get(0).getShopID()).add(sc);
        }
        for (String shopId : shopMap.keySet()) {
            logger.info("生成商店" + shopId + "订单.........");
            boolean f = true;
            String untitled = "";
            for (ShoppingCartVO sc : shopMap.get(shopId)) {
                if (Integer.parseInt(sc.getCartNum()) > sc.getSkuStock()) {
                    f = false;
                    break;
                }
                //获取所有商品名称，以,分割拼接成字符串
                untitled = untitled + sc.getProductName() + ",";
            }
            if (f) {
                System.out.println("-----库存校验完成");
                logger.info("product stock is OK...");
                Map<String, String> map = new HashMap<>();

                //2.保存订单
                order.setUntitled(untitled);
                order.setCreateTime(new Date());
                order.setStatus("1");
                //生成订单编号
                String orderId = UUID.randomUUID().toString().replace("-", "");
                order.setOrderId(orderId);
                int i = ordersMapper.insert(order);

                //3.生成商品快照
                for (ShoppingCartVO sc : shopMap.get(shopId)) {
                    int cnum = Integer.parseInt(sc.getCartNum());
                    String itemId = System.currentTimeMillis() + "" + (new Random().nextInt(89999) + 10000);
                    OrderItem orderItem = new OrderItem(itemId, orderId, sc.getProductId(), sc.getProductName(), sc.getProductImg(), sc.getSkuId(), sc.getSkuName(), new BigDecimal(sc.getSellPrice()), cnum, new BigDecimal(sc.getSellPrice() * cnum), new Date(), new Date(), 0);
                    orderItemMapper.insert(orderItem);
                    //增加销量
                    Product product = new Product();
                    Example example = new Example(Product.class);
                    Example.Criteria criteria = example.createCriteria();
                    criteria.andEqualTo("productId", sc.getProductId());
                    List<Product> products = productMapper.selectByExample(example);
                    product.setSoldNum(products.get(0).getSoldNum() + 1);
                    productMapper.updateByPrimaryKeySelective(product);
                }

                //4.扣减库存：根据套餐ID修改套餐库存量
                for (ShoppingCartVO sc : shopMap.get(shopId)) {
                    String skuId = sc.getSkuId();
                    int newStock = sc.getSkuStock() - Integer.parseInt(sc.getCartNum());
                    ProductSku productSku = new ProductSku();
                    productSku.setSkuId(skuId);
                    productSku.setStock(newStock);
                    productSkuMapper.updateByPrimaryKeySelective(productSku);
                }

                //5.删除购物车：当购物车中的记录购买成功之后，购物车中对应做删除操作
                for (int cid : cidsList) {
                    shoppingCartMapper.deleteByPrimaryKey(cid);
                }
                logger.info("add order finished...");
                map.put("orderId", orderId);
                map.put("productNames", untitled);
                mapList.add(map);
            } else {
                //表示库存不足
                Map<String, String> newMap = new HashMap<>();
                newMap.put("orderId", null);
                newMap.put("productNames", untitled);
                mapList.add(newMap);
            }
        }
        return mapList;
    }


    @Override
    @Transactional
    public ResultVO deleteOrders(String ids) {
        try {
            String[] orderIds = ids.split(",");
//            List<Integer> orderIds = new ArrayList<>();
//            for (int i=0; i<arr.length; i++){
//                orderIds.add(Integer.parseInt(arr[i]));
//            }


            //删除orders表
            Example example = new Example(Orders.class);
            Example.Criteria criteria = example.createCriteria();
            for (String orderId : orderIds) {
                criteria.orEqualTo("orderId", orderId);
            }
            int ret = ordersMapper.deleteByExample(example);

            //删除order_item表
            Example example1 = new Example(OrderItem.class);
            Example.Criteria criteria1 = example1.createCriteria();
            for (String orderId : orderIds) {
                criteria1.orEqualTo("orderId", orderId);
            }
            int ret1 = orderItemMapper.deleteByExample(example1);

            if (ret == 0 || ret1 == 0) {
                return new ResultVO(ResStatus.NO, "找不到记录", null);
            } else if (orderIds.length == ret1 && orderIds.length == ret) {
                return new ResultVO(ResStatus.OK, "success", null);
            } else {
                return new ResultVO(ResStatus.NO, "部分删除失败", null);
            }

        } catch (Exception e) {
            e.printStackTrace();
            return new ResultVO(ResStatus.NO, "数据库层删除失败！", null);
        }
    }

    //立即购买实现
    @Override
    @Transactional
    public Map<String, String> addInstanceOrder(String productId, Orders order) throws SQLException {
        logger.info("add order begin...");
        Map<String, String> map = new HashMap<>();

        Example example = new Example(Product.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("productId", productId);
        criteria.andEqualTo("productStatus", 1);//状态为1表示上架商品
        List<Product> products = productMapper.selectByExample(example);
        String untitled = products.get(0).getProductName();//根据productId获取商品名字
        logger.info("!!!!!!!!!!!!!!!!!!");
        logger.info(untitled);
        logger.info("!!!!!!!!!!!!!!!");
        String skuId = productSkuMapper.selectSkusByProductId(productId).get(0).getSkuId();
        Integer stock = productSkuMapper.selectSkusByProductId(productId).get(0).getStock();
        String skuImg = productSkuMapper.selectSkusByProductId(productId).get(0).getSkuImg();
        String skuName = productSkuMapper.selectSkusByProductId(productId).get(0).getSkuName();
        Integer price = productSkuMapper.selectSkusByProductId(productId).get(0).getSellPrice();
        if (stock > 0) {
            logger.info("product stock is OK...");
            //保存订单
            order.setUntitled(untitled);
            order.setCreateTime(new Date());
            order.setStatus("1");
            //生成订单编号
            String orderId = UUID.randomUUID().toString().replace("-", "");
            order.setOrderId(orderId);
            int i = ordersMapper.insert(order);

            //生成商品快照
            String itemId = System.currentTimeMillis() + "" + (new Random().nextInt(89999) + 10000);
            OrderItem orderItem = new OrderItem(itemId, orderId, productId, untitled, skuImg, skuId, skuName, new BigDecimal(price), 1, new BigDecimal(price), new Date(), new Date(), 0);
            orderItemMapper.insert(orderItem);

            //减少库存
            ProductSku productSku = new ProductSku();
            productSku.setSkuId(skuId);
            productSku.setStock(stock - 1);
            productSkuMapper.updateByPrimaryKeySelective(productSku);

            //增加销量
            Product product1 = new Product();
            product1.setSoldNum(products.get(0).getSoldNum() + 1);
            productMapper.updateByPrimaryKeySelective(product1);

            logger.info("add order finished...");
            map.put("orderId", orderId);
            map.put("productNames", untitled);
            return map;
        } else {
            //表示库存不足
            return null;
        }
    }

    @Override
    public int updateOrderStatus(String orderId, String status) {
        Orders orders = new Orders();
        orders.setOrderId(orderId);
        orders.setStatus(status);
        if (status.equals("2")) {
            orders.setDeliveryTime(new Date());
        }
        if (status.equals("3")) {
            orders.setFlishTime(new Date());
        }
        int i = ordersMapper.updateByPrimaryKeySelective(orders);
        return i;
    }

    @Override
    public ResultVO getOrderById(String orderId) {
        Orders order = ordersMapper.selectByPrimaryKey(orderId);
        return new ResultVO(ResStatus.OK, "sucesss", order.getStatus());
    }

    @Override
    @Transactional(isolation = Isolation.SERIALIZABLE)
    public void closeOrder(String orderId) {
        synchronized (this) {
            //  1.修改当前订单：status=6 已关闭  close_type=1 超时未支付
            Orders cancleOrder = new Orders();
            cancleOrder.setOrderId(orderId);
            cancleOrder.setStatus("6");  //已关闭
            cancleOrder.setCloseType(1); //关闭类型：超时未支付
            ordersMapper.updateByPrimaryKeySelective(cancleOrder);

            //  2.还原库存：先根据当前订单编号查询商品快照（skuid  buy_count）--->修改product_sku
            Example example1 = new Example(OrderItem.class);
            Example.Criteria criteria1 = example1.createCriteria();
            criteria1.andEqualTo("orderId", orderId);
            List<OrderItem> orderItems = orderItemMapper.selectByExample(example1);
            //还原库存
            for (int j = 0; j < orderItems.size(); j++) {
                OrderItem orderItem = orderItems.get(j);
                //修改
                ProductSku productSku = productSkuMapper.selectByPrimaryKey(orderItem.getSkuId());
                productSku.setStock(productSku.getStock() + orderItem.getBuyCounts());
                productSkuMapper.updateByPrimaryKey(productSku);
            }
        }
    }

    @Override
    public ResultVO listOrders(String userId, String status, int pageNum, int limit) {
        //1.分页查询
        int start = (pageNum - 1) * limit;
        List<OrdersVO> ordersVOS = ordersMapper.selectOrders(userId, status, start, limit);

        //2.查询总记录数
        Example example = new Example(Orders.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andLike("userId", userId);
        if (status != null && !"".equals(status)) {
            criteria.andLike("status", status);
        }
        int count = ordersMapper.selectCountByExample(example);

        //3.计算总页数
        int pageCount = count % limit == 0 ? count / limit : count / limit + 1;

        //4.封装数据
        PageHelper<OrdersVO> pageHelper = new PageHelper<>(count, pageCount, ordersVOS);

        return new ResultVO(ResStatus.OK, "SUCCESS", pageHelper);
    }

    @Override
    public ResultVO listOrdersByShopId(String shopId, String status, int pageNum, int limit) {
        //1.分页查询
        int start = (pageNum - 1) * limit;
        List<OrdersVO> ordersVOS = ordersMapper.selectOrdersByShopId(shopId, status, start, limit);

        //2.查询总记录数
        int count = ordersMapper.selectOrdersCountByShopId(shopId, status);

        //3.计算总页数
        int pageCount = count % limit == 0 ? count / limit : count / limit + 1;

        //4.封装数据
        PageHelper<OrdersVO> pageHelper = new PageHelper<>(count, pageCount, ordersVOS);

        return new ResultVO(ResStatus.OK, "SUCCESS", pageHelper);
    }


}
