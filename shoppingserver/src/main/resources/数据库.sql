/*
 Navicat Premium Data Transfer

 Source Server         : shopping
 Source Server Type    : MySQL
 Source Server Version : 50650
 Source Host           : 121.40.110.36:3306
 Source Schema         : db

 Target Server Type    : MySQL
 Target Server Version : 50650
 File Encoding         : 65001

*/

-- ----------------------------
-- Create DataBase
-- -----------------------------
CREATE DATABASE `mall` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
    `category_id` int NOT NULL AUTO_INCREMENT COMMENT '主键 分类id主键',
    `category_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '分类名称 分类名称',
    `category_level` int NOT NULL COMMENT '分类层级 分类得类型，\n1:一级大分类\n2:二级分类\n3:三级小分类',
    `parent_id` int NOT NULL COMMENT '父层级id 父id 上一级依赖的id，1级分类则为0，二级三级分别依赖上一级',
    `category_icon` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '图标 logo',
    `category_slogan` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '口号',
    `category_pic` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '分类图',
    `category_bg_color` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '背景颜色',
    PRIMARY KEY (`category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='商品分类';

-- ----------------------------
-- Records of category
-- ----------------------------

INSERT INTO mall.category (category_name,category_level,parent_id,category_icon,category_slogan,category_pic,category_bg_color)
VALUES
('手机',1,0,'cake.png','手机','act1.png','black'),
('饼干/膨化',1,0,'cookies.png','吃吃吃','act2.png','black'),
('熟食/肉类',1,0,'meat.png','nice！nice！nice！','act3.png','black'),
('素食/卤味',1,0,'bamboo.png',NULL,'act1.png','black'),
('坚果/炒货',1,0,'nut.png','酥酥脆脆，回味无穷','act2.png','black'),
('糖果/蜜饯',1,0,'candy.png',NULL,'act3.png','black'),
('巧克力',1,0,'chocolate.png',NULL,'act1.png','black'),
('海味/河鲜',1,0,'fish.png',NULL,'act2.png','black'),
('花茶/果茶',1,0,'tea.png','健康快乐每一天','act3.png','black'),
('品牌/礼包',1,0,'package.png','每日一个小惊喜','act1.png','black');

-- ----------------------------
-- Table structure for index_img
-- ----------------------------
DROP TABLE IF EXISTS `index_img`;
CREATE TABLE `index_img` (
     `img_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '主键',
     `img_url` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '图片 图片地址',
     `img_bg_color` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '背景色 背景颜色',
     `prod_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商品id 商品id',
     `category_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商品分类id 商品分类id',
     `index_type` int DEFAULT NULL COMMENT '轮播图类型 轮播图类型，用于判断，可以根据商品id或者分类进行页面跳转，1：商品 2：分类',
     `seq` int DEFAULT NULL COMMENT '轮播图展示顺序 轮播图展示顺序，从小到大',
     `status` int DEFAULT NULL COMMENT '是否展示:1表示正常显示，0表示下线 是否展示，1：展示    0：不展示',
     `create_time` datetime DEFAULT NULL COMMENT '创建时间 创建时间',
     `update_time` datetime DEFAULT NULL COMMENT '更新时间 更新',
     PRIMARY KEY (`img_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='轮播图 ';
-- ----------------------------
-- Records of index_img
-- ----------------------------
INSERT INTO mall.index_img (img_id,img_url,img_bg_color,prod_id,category_id,index_type,seq,status,create_time,update_time)
VALUES
('18699339','https://adguycn990-typoraimage.oss-cn-hangzhou.aliyuncs.com/202307031425050.jpg',NULL,'19561127',NULL,NULL,NULL,NULL,NULL,NULL),
('48746376','https://adguycn990-typoraimage.oss-cn-hangzhou.aliyuncs.com/202307031424183.jpg',NULL,'setsu',NULL,NULL,NULL,NULL,NULL,NULL),
('49922048','https://adguycn990-typoraimage.oss-cn-hangzhou.aliyuncs.com/202307031424285.jpg',NULL,'doodle',NULL,NULL,NULL,NULL,NULL,NULL),
('58579873','https://adguycn990-typoraimage.oss-cn-hangzhou.aliyuncs.com/202307031423047.jpg',NULL,'kaka',NULL,NULL,NULL,NULL,NULL,NULL),
('66981602','https://adguycn990-typoraimage.oss-cn-hangzhou.aliyuncs.com/202307031424437.jpg',NULL,'62087398',NULL,NULL,NULL,NULL,NULL,NULL),
('67729381','https://adguycn990-typoraimage.oss-cn-hangzhou.aliyuncs.com/202307031423047.jpg',NULL,'87006304',NULL,NULL,NULL,NULL,NULL,NULL),
('80100670','https://adguycn990-typoraimage.oss-cn-hangzhou.aliyuncs.com/202307031425910.jpg',NULL,'玄月',NULL,NULL,NULL,NULL,NULL,NULL);

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
CREATE TABLE `order_item` (
      `item_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '订单项ID',
      `order_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '订单ID',
      `product_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品ID',
      `product_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品名称',
      `product_img` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商品图片',
      `sku_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'skuID',
      `sku_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'sku名称',
      `product_price` decimal(32,8) NOT NULL COMMENT '商品价格',
      `buy_counts` int NOT NULL COMMENT '购买数量',
      `total_amount` decimal(32,8) DEFAULT NULL COMMENT '商品总金额',
      `basket_date` datetime DEFAULT NULL COMMENT '加入购物车时间',
      `buy_time` datetime DEFAULT NULL COMMENT '购买时间',
      `is_comment` int DEFAULT NULL COMMENT '评论状态： 0 未评价  1 已评价',
      PRIMARY KEY (`item_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='订单项/快照 ';

-- ----------------------------
-- Records of order_item
-- ----------------------------
INSERT INTO mall.order_item (item_id,order_id,product_id,product_name,product_img,sku_id,sku_name,product_price,buy_counts,total_amount,basket_date,buy_time,is_comment)
VALUES
('164095092252969179','87a12c3dba8d4b2ea007bf8a1f568f33','52363235','OPPO Find N',NULL,'94828632',NULL,8999.00000000,1,8999.00000000,'2021-12-31 19:42:03','2021-12-31 19:42:03',0),
('164095856004462497','ec5f5bf1ead74148b10d116cc0c0d872','19561127','小米12 Pro',NULL,'69466429',NULL,4999.00000000,1,4999.00000000,'2021-12-31 21:49:20','2021-12-31 21:49:20',0),
('164104350520466011','38a505a6733a4f5898bddc66bb92976b','18554393','三星 Galaxy Z Fold3','img/三星_2021123100491225618805.jp','23010839',NULL,14799.00000000,1,14799.00000000,'2022-01-01 21:25:05','2022-01-01 21:25:05',0),
('164109378148510091','f7dbea4bc0d246ae867029eb75ebccd2','19561127','小米12 Pro','img/xiaomi.jpg__2021123100555771','69466429',NULL,4999.00000000,1,4999.00000000,'2022-01-02 11:23:01','2022-01-02 11:23:01',0),
('164109378150619079','f7dbea4bc0d246ae867029eb75ebccd2','66232947','荣耀 Magic3 至臻版','img/magic.jpg__20211231005317785','76620727',NULL,6999.00000000,1,6999.00000000,'2022-01-02 11:23:02','2022-01-02 11:23:02',0),
('164125699007587866','ca1e9b98999b444ba0030d826dbf0e35','8653137','三只松鼠每日坚果','img/7aa9c2fad2d8275b_20220103164','8787477',NULL,149.00000000,1,149.00000000,'2022-01-04 08:43:10','2022-01-04 08:43:10',0),
('164126219867167322','81fc8c2143ce4aec8f6bc7bd682c3ee6','8653137','三只松鼠每日坚果','img/7aa9c2fad2d8275b_20220103164','60964669',NULL,149.00000000,10000,1490000.00000000,'2022-01-04 10:09:59','2022-01-04 10:09:59',0),
('164126479313670275','ef5f8dde6a064c2fa5d90b061e48e5ab','8653137','三只松鼠每日坚果','img/7aa9c2fad2d8275b_20220103164','6037983',NULL,149.00000000,50,7450.00000000,'2022-01-04 10:53:13','2022-01-04 10:53:13',0),
('164126485226096827','1bced483a35447e584b29178a43efc97','8653137','三只松鼠每日坚果','img/7aa9c2fad2d8275b_20220103164','6037983',NULL,149.00000000,10000,1490000.00000000,'2022-01-04 10:54:12','2022-01-04 10:54:12',0),
('164126686721931350','61024619acc046b2882a951a7c680af5','8653137','三只松鼠每日坚果',NULL,'6037983',NULL,149.00000000,1,149.00000000,'2022-01-04 11:27:47','2022-01-04 11:27:47',0);
INSERT INTO mall.order_item (item_id,order_id,product_id,product_name,product_img,sku_id,sku_name,product_price,buy_counts,total_amount,basket_date,buy_time,is_comment)
VALUES
('164127466854143054','2a510aab864440ada4f064a9f173f3b7','66232947','荣耀 Magic3 至臻版',NULL,'76620727',NULL,6999.00000000,1,6999.00000000,'2022-01-04 13:37:49','2022-01-04 13:37:49',0),
('164127682090562882','5f7e7e83e8974603ae35c2d0099a8b85','6432001','手机','img/hai_dai_20220103221220941251','84070005',NULL,1000.00000000,10,10000.00000000,'2022-01-04 14:13:41','2022-01-04 14:13:41',0),
('168835190855178056','534b5f803a494e0c8daaa7ad839dcbb4','18554393','三星 Galaxy Z Fold3',NULL,'95644198',NULL,14799.00000000,1,14799.00000000,'2023-07-03 10:38:29','2023-07-03 10:38:29',0),
('168835191271598201','949d8270d26f406baf10bbbceb779998','18554393','三星 Galaxy Z Fold3',NULL,'95644198',NULL,14799.00000000,1,14799.00000000,'2023-07-03 10:38:33','2023-07-03 10:38:33',0),
('168835191341591416','db57bac2f2214cc998f30667f1a18b57','18554393','三星 Galaxy Z Fold3',NULL,'95644198',NULL,14799.00000000,1,14799.00000000,'2023-07-03 10:38:33','2023-07-03 10:38:33',0),
('168835191409433711','6e488b090fd54718afb15aa1676ea804','18554393','三星 Galaxy Z Fold3',NULL,'95644198',NULL,14799.00000000,1,14799.00000000,'2023-07-03 10:38:34','2023-07-03 10:38:34',0),
('168835191472454170','67ffd9fb562945d997452b1ddac98192','18554393','三星 Galaxy Z Fold3',NULL,'95644198',NULL,14799.00000000,1,14799.00000000,'2023-07-03 10:38:35','2023-07-03 10:38:35',0),
('168835191514473764','eff789eb24ff483a8f009ccb550349b3','18554393','三星 Galaxy Z Fold3',NULL,'95644198',NULL,14799.00000000,1,14799.00000000,'2023-07-03 10:38:35','2023-07-03 10:38:35',0),
('168835191579686138','87ae143fa5264a2dba38dd1f49d37114','18554393','三星 Galaxy Z Fold3',NULL,'95644198',NULL,14799.00000000,1,14799.00000000,'2023-07-03 10:38:36','2023-07-03 10:38:36',0),
('168835191640015205','b277306c4b93492d810608ce1650cb23','18554393','三星 Galaxy Z Fold3',NULL,'95644198',NULL,14799.00000000,1,14799.00000000,'2023-07-03 10:38:36','2023-07-03 10:38:36',0);
INSERT INTO mall.order_item (item_id,order_id,product_id,product_name,product_img,sku_id,sku_name,product_price,buy_counts,total_amount,basket_date,buy_time,is_comment)
VALUES
('168836605030055942','4a3a726f729d4376b5896f051cb75e2f','87006304','绝味鸭脖',NULL,'87179212',NULL,60.00000000,1,60.00000000,'2023-07-03 14:34:10','2023-07-03 14:34:10',0),
('168837462250957885','cb6168742db94e8f8466750776382ea0','18554393','三星 Galaxy Z Fold3',NULL,'95644198',NULL,14799.00000000,1,14799.00000000,'2023-07-03 16:57:03','2023-07-03 16:57:03',0),
('168837462291167491','a8980e6ebd51442986c5f27c2ff43178','18554393','三星 Galaxy Z Fold3',NULL,'95644198',NULL,14799.00000000,1,14799.00000000,'2023-07-03 16:57:03','2023-07-03 16:57:03',0),
('168837462308017536','9fe00c66b6334bb59e369339b9ef3716','18554393','三星 Galaxy Z Fold3',NULL,'95644198',NULL,14799.00000000,1,14799.00000000,'2023-07-03 16:57:03','2023-07-03 16:57:03',0),
('168837462325492394','bd16ae27bc014808b71bd221f25d1d42','18554393','三星 Galaxy Z Fold3',NULL,'95644198',NULL,14799.00000000,1,14799.00000000,'2023-07-03 16:57:03','2023-07-03 16:57:03',0),
('168837462343042592','7ce23c2cabf848f0bc07069533d882df','18554393','三星 Galaxy Z Fold3',NULL,'95644198',NULL,14799.00000000,1,14799.00000000,'2023-07-03 16:57:03','2023-07-03 16:57:03',0),
('168837462393859771','e46c0262d1714c948c4869d7d292cadc','18554393','三星 Galaxy Z Fold3',NULL,'95644198',NULL,14799.00000000,1,14799.00000000,'2023-07-03 16:57:04','2023-07-03 16:57:04',0);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
      `order_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '订单ID 同时也是订单编号',
      `user_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户ID',
      `untitled` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '产品名称（多个产品用,隔开）',
      `receiver_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '收货人快照',
      `receiver_mobile` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '收货人手机号快照',
      `receiver_address` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '收货地址快照',
      `total_amount` decimal(32,8) DEFAULT NULL COMMENT '订单总价格',
      `actual_amount` int DEFAULT NULL COMMENT '实际支付总价格',
      `pay_type` int DEFAULT NULL COMMENT '支付方式 1:微信 2:支付宝',
      `order_remark` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '订单备注',
      `status` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '订单状态 1:待付款 2:待发货 3:待收货 4:待评价 5:已完成 6:已关闭',
      `delivery_type` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '配送方式',
      `delivery_flow_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '物流单号',
      `order_freight` decimal(32,8) DEFAULT '0.00000000' COMMENT '订单运费 默认可以为零，代表包邮',
      `delete_status` int DEFAULT '0' COMMENT '逻辑删除状态 1: 删除 0:未删除',
      `create_time` datetime DEFAULT NULL COMMENT '创建时间（成交时间）',
      `update_time` datetime DEFAULT NULL COMMENT '更新时间',
      `pay_time` datetime DEFAULT NULL COMMENT '付款时间',
      `delivery_time` datetime DEFAULT NULL COMMENT '发货时间',
      `flish_time` datetime DEFAULT NULL COMMENT '完成时间',
      `cancel_time` datetime DEFAULT NULL COMMENT '取消时间',
      `close_type` int DEFAULT NULL COMMENT '订单关闭类型1-超时未支付 2-退款关闭 4-买家取消 15-已通过货到付款交易',
      PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='订单 ';

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO mall.orders (order_id,user_id,untitled,receiver_name,receiver_mobile,receiver_address,total_amount,actual_amount,pay_type,order_remark,status,delivery_type,delivery_flow_id,order_freight,delete_status,create_time,update_time,pay_time,delivery_time,flish_time,cancel_time,close_type)
VALUES
('1bced483a35447e584b29178a43efc97','13','三只松鼠每日坚果,','zxf','17879632526','南昌',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,'2022-01-04 10:54:12',NULL,NULL,NULL,NULL,NULL,NULL),
('2a510aab864440ada4f064a9f173f3b7','2','荣耀 Magic3 至臻版','zyy','13188888888','江西省南昌市南昌大学前湖校区',NULL,NULL,NULL,NULL,'3',NULL,NULL,NULL,NULL,'2022-01-04 13:37:49',NULL,NULL,'2022-01-04 13:38:08','2022-01-04 13:38:14',NULL,NULL),
('38a505a6733a4f5898bddc66bb92976b','2','三星 Galaxy Z Fold3,','zyy','12345456','江西省南昌市南昌大学前湖校区',NULL,NULL,NULL,NULL,'3',NULL,NULL,NULL,NULL,'2022-01-01 21:25:05',NULL,NULL,'2022-01-01 23:08:52','2022-01-04 12:09:14',NULL,NULL),
('4a3a726f729d4376b5896f051cb75e2f','2','绝味鸭脖','你爹','13188888888','幻想乡',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,'2023-07-03 14:34:10',NULL,NULL,NULL,NULL,NULL,NULL),
('534b5f803a494e0c8daaa7ad839dcbb4','1','三星 Galaxy Z Fold3','jh','13065859690','幻想乡',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,'2023-07-03 10:38:29',NULL,NULL,NULL,NULL,NULL,NULL),
('5f7e7e83e8974603ae35c2d0099a8b85','9','手机','gjl','13217065163','南昌市南昌大学',NULL,NULL,NULL,NULL,'3',NULL,NULL,NULL,NULL,'2022-01-04 14:13:41',NULL,NULL,'2022-01-04 14:14:01','2022-01-04 14:14:19',NULL,NULL),
('61024619acc046b2882a951a7c680af5','9','三只松鼠每日坚果','gjl','13217065163','南昌市南昌大学',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,'2022-01-04 11:27:47',NULL,NULL,NULL,NULL,NULL,NULL),
('67ffd9fb562945d997452b1ddac98192','1','三星 Galaxy Z Fold3','jh','13065859690','幻想乡',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,'2023-07-03 10:38:35',NULL,NULL,NULL,NULL,NULL,NULL),
('6e488b090fd54718afb15aa1676ea804','1','三星 Galaxy Z Fold3','jh','13065859690','幻想乡',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,'2023-07-03 10:38:34',NULL,NULL,NULL,NULL,NULL,NULL),
('7ce23c2cabf848f0bc07069533d882df','16','三星 Galaxy Z Fold3','123','13065859690','123',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,'2023-07-03 16:57:03',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO mall.orders (order_id,user_id,untitled,receiver_name,receiver_mobile,receiver_address,total_amount,actual_amount,pay_type,order_remark,status,delivery_type,delivery_flow_id,order_freight,delete_status,create_time,update_time,pay_time,delivery_time,flish_time,cancel_time,close_type)
VALUES
('81fc8c2143ce4aec8f6bc7bd682c3ee6','13','三只松鼠每日坚果,','zxf','17879632526','南昌',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,'2022-01-04 10:09:59',NULL,NULL,NULL,NULL,NULL,NULL),
('87a12c3dba8d4b2ea007bf8a1f568f33','4','OPPO Find N','zyy','12345678909','江西省南昌市南昌大学前湖校区',NULL,NULL,NULL,NULL,'2',NULL,NULL,NULL,NULL,'2021-12-31 19:42:03',NULL,NULL,'2023-07-03 13:35:53',NULL,NULL,NULL),
('87ae143fa5264a2dba38dd1f49d37114','1','三星 Galaxy Z Fold3','jh','13065859690','幻想乡',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,'2023-07-03 10:38:36',NULL,NULL,NULL,NULL,NULL,NULL),
('949d8270d26f406baf10bbbceb779998','1','三星 Galaxy Z Fold3','jh','13065859690','幻想乡',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,'2023-07-03 10:38:33',NULL,NULL,NULL,NULL,NULL,NULL),
('9fe00c66b6334bb59e369339b9ef3716','16','三星 Galaxy Z Fold3','123','13065859690','123',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,'2023-07-03 16:57:03',NULL,NULL,NULL,NULL,NULL,NULL),
('a8980e6ebd51442986c5f27c2ff43178','16','三星 Galaxy Z Fold3','123','13065859690','123',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,'2023-07-03 16:57:03',NULL,NULL,NULL,NULL,NULL,NULL),
('b277306c4b93492d810608ce1650cb23','1','三星 Galaxy Z Fold3','jh','13065859690','幻想乡',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,'2023-07-03 10:38:36',NULL,NULL,NULL,NULL,NULL,NULL),
('bd16ae27bc014808b71bd221f25d1d42','16','三星 Galaxy Z Fold3','123','13065859690','123',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,'2023-07-03 16:57:03',NULL,NULL,NULL,NULL,NULL,NULL),
('ca1e9b98999b444ba0030d826dbf0e35','2','三只松鼠每日坚果,','zyy','13188888888','江西省南昌市南昌大学前湖校区',NULL,NULL,NULL,NULL,'3',NULL,NULL,NULL,NULL,'2022-01-04 08:43:10',NULL,NULL,'2022-01-04 08:43:58','2022-01-04 08:44:14',NULL,NULL),
('cb6168742db94e8f8466750776382ea0','16','三星 Galaxy Z Fold3','123','13065859690','123',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,'2023-07-03 16:57:03',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO mall.orders (order_id,user_id,untitled,receiver_name,receiver_mobile,receiver_address,total_amount,actual_amount,pay_type,order_remark,status,delivery_type,delivery_flow_id,order_freight,delete_status,create_time,update_time,pay_time,delivery_time,flish_time,cancel_time,close_type)
VALUES
('db57bac2f2214cc998f30667f1a18b57','1','三星 Galaxy Z Fold3','jh','13065859690','幻想乡',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,'2023-07-03 10:38:33',NULL,NULL,NULL,NULL,NULL,NULL),
('e46c0262d1714c948c4869d7d292cadc','16','三星 Galaxy Z Fold3','123','13065859690','123',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,'2023-07-03 16:57:04',NULL,NULL,NULL,NULL,NULL,NULL),
('ec5f5bf1ead74148b10d116cc0c0d872','9','小米12 Pro','gjl','13217065163','南昌市南昌大学',NULL,NULL,NULL,NULL,'3',NULL,NULL,NULL,NULL,'2021-12-31 21:49:20',NULL,NULL,'2021-12-31 21:49:59','2021-12-31 21:50:08',NULL,NULL),
('ef5f8dde6a064c2fa5d90b061e48e5ab','13','三只松鼠每日坚果,','zxf','17879632526','南昌',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,'2022-01-04 10:53:13',NULL,NULL,NULL,NULL,NULL,NULL),
('eff789eb24ff483a8f009ccb550349b3','1','三星 Galaxy Z Fold3','jh','13065859690','幻想乡',NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,'2023-07-03 10:38:35',NULL,NULL,NULL,NULL,NULL,NULL),
('f7dbea4bc0d246ae867029eb75ebccd2','2','小米12 Pro,荣耀 Magic3 至臻版,','zyy','12345456','江西省南昌市南昌大学前湖校区',NULL,NULL,NULL,NULL,'3',NULL,NULL,NULL,NULL,'2022-01-02 11:23:01',NULL,NULL,'2023-07-03 13:35:55','2023-07-03 14:55:36',NULL,NULL);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
       `product_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品主键id',
       `product_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品名称 商品名称',
       `category_id` int NOT NULL COMMENT '分类外键id 分类id',
       `root_category_id` int NOT NULL COMMENT '一级分类外键id 一级分类id，用于优化查询',
       `sold_num` int NOT NULL COMMENT '销量 累计销售',
       `product_status` int NOT NULL COMMENT '默认是1，表示正常状态, -1表示删除, 0下架 默认是1，表示正常状态, -1表示删除, 0下架',
       `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品内容 商品内容',
       `shop_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
       PRIMARY KEY (`product_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='商品 商品信息相关表：分类表，商品图片表，商品规格表，商品参数表';

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO mall.product (product_id,product_name,category_id,root_category_id,sold_num,product_status,content,shop_id)
VALUES
('16302465','玫瑰花茶',9,0,0,1,'北京同仁堂玫瑰花茶 中华老字号','50085027'),
('18554393','三星 Galaxy Z Fold3',1,0,19,1,'屏下摄像折叠屏 双模5G手机 Spen书写 IPX8防水','22432443'),
('19561127','小米12 Pro',1,0,3,1,'骁龙8 Gen 2K AMOLED 120Hz高刷 5000万超清三主摄','22432443'),
('25031649','优乐麦干烙蛋糕',2,0,0,1,'优乐麦干烙蛋糕饼干3斤整箱8斤干酪金典鸡蛋芝麻煎饼散装零食品','3'),
('25959471','iPhone 13 Pro Max',1,0,0,1,'iPhone 13 Pro 强得很','22432443'),
('26990382','牛肉干',3,0,0,1,'大片真牛肉 鲜香嚼着爽 有嚼劲不干硬','50085027'),
('2840370','内蒙古酱牛肉',3,0,1,1,'内蒙古酱牛肉五香卤味熟食牛腱真空开袋即食健身代餐熟食酱牛肉','3'),
('34793911','青豌豆',5,0,0,1,'颗粒饱满、颗颗入味、回味悠久','61949229'),
('37437797','河鲜',8,0,0,1,'江南特产苏州三白白鱼白虾银鱼小鱼干货鱼干年货鱼类零食品河鲜','1'),
('42122875','麻辣王子',4,0,0,1,'卤味素食麻辣大礼包散混装整箱小吃湖南休闲充饥夜宵熟食零食','3');
INSERT INTO mall.product (product_id,product_name,category_id,root_category_id,sold_num,product_status,content,shop_id)
VALUES
('52363235','OPPO Find N',1,0,1,1,'5G新品 折叠旗舰 全网通','22432443'),
('54170782','茶叶',9,0,0,1,'蜜桃白桃乌龙茶绿茶茶包花茶组合養生茶叶冷泡茶袋泡水果茶小包','1'),
('6033768','百草味-坚果',5,0,0,1,'百草味-坚果大礼包1600g/9袋混合干果礼盒年货休闲零食整箱送礼','50085027'),
('62087398','坚果大礼包',10,0,0,1,'春节年货礼盒装定制每日坚果大礼包过新年送礼品置办走亲戚送长辈','1'),
('63031777','大白兔奶糖',6,0,0,1,'严选原料 浓香醇厚 嚼劲十足','50085027'),
('66232947','荣耀 Magic3 至臻版',1,0,3,1,'多主摄计算摄影 骁龙888Plus 纳米微晶面板','22432443'),
('71662231','进口混合坚果礼盒装',10,0,0,1,'美荻斯进口混合坚果礼盒装高档木箱干果大礼包春节送礼品年货团购','1'),
('75436070','实木提篮',10,0,0,1,'新年年货礼盒套装送礼实木提篮每日坚果大礼包定制年会礼品置办','1'),
('77885075','红黑巧克力',7,0,0,1,'俄罗斯网红黑巧克力纯可可脂每日黑巧苦巧原装进口食品袋装零食','50085027'),
('79875193','雪海梅乡果干果脯酸梅干',6,0,0,1,'雪海梅乡果干果脯酸梅干10口味500g话梅干清平乐蜜饯休闲零食梅果','50085027');
INSERT INTO mall.product (product_id,product_name,category_id,root_category_id,sold_num,product_status,content,shop_id)
VALUES
('80836525','vivo X70 Pro',1,0,1,1,'5nm旗舰芯片 专业影像芯片V1 蔡司光学镜头 120Hz高刷','22432443'),
('86223418','混合坚果礼盒装',10,0,0,1,'混合坚果礼盒装送长辈团购定制logo组过新春节年货大礼包品走亲戚','1'),
('8653137','三只松鼠每日坚果',5,0,17,1,'750g/30袋 年货零食大礼包坚果礼盒送礼儿童孕妇混合干果腰果夏威夷果核桃仁开心果巴旦木','38872933'),
('87006304','绝味鸭脖',4,0,2,1,'绝味鸭脖 麻辣卤鸭脖 鲜货套餐 休闲零食','50085027'),
('95595959','HUAWEI P50 Pocket',1,0,2,1,'超光谱影像系统 创新双屏操作体验','22432443');

-- ----------------------------
-- Table structure for product_comments
-- ----------------------------
DROP TABLE IF EXISTS `product_comments`;
CREATE TABLE `product_comments` (
        `comm_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ID',
        `product_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品id',
        `product_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商品名称',
        `order_item_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '订单项(商品快照)ID 可为空',
        `user_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '评论用户id 用户名须脱敏',
        `is_anonymous` int DEFAULT NULL COMMENT '是否匿名（1:是，0:否）',
        `comm_type` int DEFAULT NULL COMMENT '评价类型（1好评，0中评，-1差评）',
        `comm_level` int DEFAULT NULL COMMENT '评价等级 1：好评 2：中评 3：差评',
        `comm_content` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '评价内容',
        `comm_imgs` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '评价晒图(JSON {img1:url1,img2:url2}  )',
        `sepc_name` datetime DEFAULT NULL COMMENT '评价时间 可为空',
        `reply_status` int DEFAULT NULL COMMENT '是否回复（0:未回复，1:已回复）',
        `reply_content` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '回复内容',
        `reply_time` datetime DEFAULT NULL COMMENT '回复时间',
        `is_show` int DEFAULT NULL COMMENT '是否显示（1:是，0:否）',
        PRIMARY KEY (`comm_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='商品评价 ';
-- ----------------------------
-- Records of product_comments
-- ----------------------------
INSERT INTO mall.product_comments (comm_id,product_id,product_name,order_item_id,user_id,is_anonymous,comm_type,comm_level,comm_content,comm_imgs,sepc_name,reply_status,reply_content,reply_time,is_show)
VALUES
('1','3','咪咪虾条','10000001','4',1,1,1,'我买这不是来吃的，就是玩儿','{}','2021-04-27 14:51:10',0,NULL,'2021-04-27 14:51:32',1),
('1640958406397','19561127',NULL,NULL,'2',NULL,5,NULL,'非常好！！！',NULL,NULL,NULL,NULL,'2021-12-31 21:46:46',NULL),
('1640958623994','19561127',NULL,NULL,'9',NULL,3,NULL,'不错',NULL,NULL,NULL,NULL,'2021-12-31 21:50:24',NULL),
('1641257089413','8653137',NULL,NULL,'2',NULL,5,NULL,'哦口感很好吃，干湿分离，里面的干果很脆，益生菌的，酸酸甜甜的，小孩子也喜欢吃。蔓越莓干，和蓝莓干都好吃，包装很好，物流很快，快递公司送货上门。棒棒哒！',NULL,NULL,NULL,NULL,'2022-01-04 08:44:49',NULL),
('1641269411288','18554393',NULL,NULL,'2',NULL,4,NULL,'不错!',NULL,NULL,NULL,NULL,'2022-01-04 12:10:11',NULL),
('1641274707132','66232947',NULL,NULL,'2',NULL,5,NULL,'好！！！',NULL,NULL,NULL,NULL,'2022-01-04 13:38:27',NULL),
('1641276880760','6432001',NULL,NULL,'9',NULL,5,NULL,'很好',NULL,NULL,NULL,NULL,'2022-01-04 14:14:41',NULL),
('2','3','咪咪虾条','10000002','5',0,1,1,'nice','{img1:“mmxt2.png”}','2021-04-27 14:53:20',1,'你好我也好','2021-04-27 14:53:37',1),
('3','3','咪咪虾条','10000003','1',1,1,1,'评价内容3','{}','2021-04-27 09:36:36',0,NULL,NULL,1),
('4','3','咪咪虾条','10000004','2',1,1,1,'评价内容3','{}','2021-04-28 09:37:28',0,NULL,NULL,1);
INSERT INTO mall.product_comments (comm_id,product_id,product_name,order_item_id,user_id,is_anonymous,comm_type,comm_level,comm_content,comm_imgs,sepc_name,reply_status,reply_content,reply_time,is_show)
VALUES
('5','3','咪咪虾条','10000005','2',1,0,1,'评价内容5','{}','2021-04-28 09:38:13',0,NULL,NULL,1),
('6','3','咪咪虾条','10000006','3',1,0,1,'评价内容6','{}','2021-04-21 09:39:16',0,NULL,NULL,1),
('7','3','咪咪虾条','10000007','4',0,-1,1,'评价内容7','{}','2021-04-06 09:40:01',0,NULL,NULL,1);

-- ----------------------------
-- Table structure for product_img
-- ----------------------------
DROP TABLE IF EXISTS `product_img`;
CREATE TABLE `product_img` (
       `id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '图片主键',
       `item_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品外键id 商品外键id',
       `url` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '图片地址 图片地址',
       `sort` int NOT NULL COMMENT '顺序 图片顺序，从小到大',
       `is_main` int NOT NULL COMMENT '是否主图 是否主图，1：是，0：否',
       `created_time` datetime NOT NULL COMMENT '创建时间',
       `updated_time` datetime NOT NULL COMMENT '更新时间',
       PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='商品图片 ';
-- ----------------------------
-- Records of product_img
-- ----------------------------
INSERT INTO mall.product_img (id,item_id,url,sort,is_main,created_time,updated_time)
VALUES
('07403','25959471','https://adguycn990-typoraimage.oss-cn-hangzhou.aliyuncs.com/202307031142976.webp',1,1,'2021-12-31 16:50:30','2021-12-31 16:50:30'),
('13708601','8653137','https://adguycn990-typoraimage.oss-cn-hangzhou.aliyuncs.com/202307031312063.jpg',1,1,'2022-01-04 08:42:21','2022-01-04 08:42:21'),
('17333613','16302465','https://adguycn990-typoraimage.oss-cn-hangzhou.aliyuncs.com/202307031324403.png',1,1,'2021-12-31 19:41:02','2021-12-31 19:41:02'),
('17495471','62087398','https://adguycn990-typoraimage.oss-cn-hangzhou.aliyuncs.com/202307031329041.jpeg',1,1,'2021-12-31 16:46:12','2021-12-31 16:46:12'),
('19360763','81759814','img/tu_2022010318151119301769.png',1,1,'2022-01-04 10:15:12','2022-01-04 10:15:12'),
('25629717','18554393','https://adguycn990-typoraimage.oss-cn-hangzhou.aliyuncs.com/202307031124565.jpeg',1,1,'2021-12-31 16:49:13','2021-12-31 16:49:13'),
('26829136','25031649','https://adguycn990-typoraimage.oss-cn-hangzhou.aliyuncs.com/202307031146153.jpeg',1,1,'2021-12-31 17:09:43','2021-12-31 17:09:43'),
('27927320','26990382','https://adguycn990-typoraimage.oss-cn-hangzhou.aliyuncs.com/202307031305311.jpg',1,1,'2021-12-31 19:38:43','2021-12-31 19:38:43'),
('29294989','37437797','https://adguycn990-typoraimage.oss-cn-hangzhou.aliyuncs.com/202307031322199.jpg',1,1,'2023-07-03 10:33:53','2023-07-03 10:33:53'),
('33790728','64967901','img/6_2021123100422333787529.jpg',1,1,'2021-12-31 16:42:23','2021-12-31 16:42:23');
INSERT INTO mall.product_img (id,item_id,url,sort,is_main,created_time,updated_time)
VALUES
('37711725','34793911','https://adguycn990-typoraimage.oss-cn-hangzhou.aliyuncs.com/202307031314683.jpeg',1,1,'2022-01-03 13:46:14','2022-01-03 13:46:14'),
('43801671','42122875','https://adguycn990-typoraimage.oss-cn-hangzhou.aliyuncs.com/202307031310036.jpeg',1,1,'2021-12-31 17:06:34','2021-12-31 17:06:34'),
('55794171','54170782','https://adguycn990-typoraimage.oss-cn-hangzhou.aliyuncs.com/202307031325363.jpeg',1,1,'2021-12-31 16:51:06','2021-12-31 16:51:06'),
('64450576','63031777','https://adguycn990-typoraimage.oss-cn-hangzhou.aliyuncs.com/202307031318357.jpeg',1,1,'2021-12-31 19:33:56','2021-12-31 19:33:56'),
('71030420','19561127','https://adguycn990-typoraimage.oss-cn-hangzhou.aliyuncs.com/202307031104307.jpeg',1,1,'2021-12-31 16:55:57','2021-12-31 16:55:57'),
('73328098','71662231','https://adguycn990-typoraimage.oss-cn-hangzhou.aliyuncs.com/202307031331070.jpeg',1,1,'2021-12-31 16:49:17','2021-12-31 16:49:17'),
('7357995','6033768','https://adguycn990-typoraimage.oss-cn-hangzhou.aliyuncs.com/202307031317275.jpg',1,1,'2021-12-31 17:02:51','2021-12-31 17:02:51'),
('73828719','95595959','https://adguycn990-typoraimage.oss-cn-hangzhou.aliyuncs.com/202307031132401.jpeg',1,1,'2021-12-31 16:41:57','2021-12-31 16:41:57'),
('76675537','75436070','https://adguycn990-typoraimage.oss-cn-hangzhou.aliyuncs.com/202307031332652.jpeg',1,1,'2021-12-31 16:45:28','2021-12-31 16:45:28'),
('7812705','2840370','https://adguycn990-typoraimage.oss-cn-hangzhou.aliyuncs.com/202307031147102.jpeg',1,1,'2021-12-31 17:08:11','2021-12-31 17:08:11');
INSERT INTO mall.product_img (id,item_id,url,sort,is_main,created_time,updated_time)
VALUES
('78569170','66232947','https://adguycn990-typoraimage.oss-cn-hangzhou.aliyuncs.com/202307031130423.png',1,1,'2021-12-31 16:53:18','2021-12-31 16:53:18'),
('80689425','77885075','https://adguycn990-typoraimage.oss-cn-hangzhou.aliyuncs.com/202307031321177.jpeg',1,1,'2021-12-31 16:56:58','2021-12-31 16:56:58'),
('81251055','79875193','https://adguycn990-typoraimage.oss-cn-hangzhou.aliyuncs.com/202307031320615.jpeg',1,1,'2021-12-31 17:00:18','2021-12-31 17:00:18'),
('84571370','80836525','https://adguycn990-typoraimage.oss-cn-hangzhou.aliyuncs.com/202307031139828.png',1,1,'2021-12-31 21:08:48','2021-12-31 21:08:48'),
('87702391','86223418','https://adguycn990-typoraimage.oss-cn-hangzhou.aliyuncs.com/202307031334940.jpeg',1,1,'2021-12-31 16:47:49','2021-12-31 16:47:49'),
('88135665','87006304','https://adguycn990-typoraimage.oss-cn-hangzhou.aliyuncs.com/202307031307725.jpeg',1,1,'2021-12-31 19:36:19','2021-12-31 19:36:19'),
('9249662','7689934','img\\HUAWEI Mate X2_202201031743309202839.png',1,1,'2022-01-04 09:43:31','2022-01-04 09:43:31'),
('9429203','6432001','img/hai_dai_202201032212209412510.jpg',1,1,'2022-01-04 14:12:21','2022-01-04 14:12:21'),
('96583745','52363235','https://adguycn990-typoraimage.oss-cn-hangzhou.aliyuncs.com/202307031137416.jpeg',1,1,'2021-12-31 16:42:40','2021-12-31 16:42:40');

-- ----------------------------
-- Table structure for product_params
-- ----------------------------
DROP TABLE IF EXISTS `product_params`;
CREATE TABLE `product_params` (
      `param_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品参数id',
      `product_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品id',
      `product_place` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '产地 产地，例：中国江苏',
      `foot_period` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '保质期 保质期，例：180天',
      `brand` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '品牌名 品牌名，例：三只大灰狼',
      `factory_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '生产厂名 生产厂名，例：大灰狼工厂',
      `factory_address` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '生产厂址 生产厂址，例：大灰狼生产基地',
      `packaging_method` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '包装方式 包装方式，例：袋装',
      `weight` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '规格重量 规格重量，例：35g',
      `storage_method` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '存储方法 存储方法，例：常温5~25°',
      `eat_method` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '食用方式 食用方式，例：开袋即食',
      `create_time` datetime NOT NULL COMMENT '创建时间',
      `update_time` datetime NOT NULL COMMENT '更新时间',
      PRIMARY KEY (`param_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='商品参数 ';
-- ----------------------------
-- Records of product_params
-- ----------------------------
INSERT INTO mall.product_params (param_id,product_id,product_place,foot_period,brand,factory_name,factory_address,packaging_method,weight,storage_method,eat_method,create_time,update_time)
VALUES
('1','3','中国湖北武汉','12个月','咪咪','贤磊咪咪虾条有限责任公司','湖北武汉江夏区光谷大道77号','袋装','50g','常温保存','开袋即食','2021-04-27 11:53:20','2021-04-27 11:53:35'),
('2','19','中国湖北武汉','12个月','卫龙','贤磊咪咪虾条有限责任公司','湖北武汉江夏区光谷大道77号','袋装','50g','常温保存','开袋即食','2021-04-27 11:53:20','2021-04-27 11:53:35'),
('3','20','中国湖北武汉','12个月','威龙','贤磊咪咪虾条有限责任公司','湖北武汉江夏区光谷大道77号','袋装','50g','常温保存','开袋即食','2021-04-27 11:53:20','2021-04-27 11:53:35'),
('4','21','中国湖北武汉','12个月','卫龙','贤磊咪咪虾条有限责任公司','湖北武汉江夏区光谷大道77号','袋装','50g','常温保存','开袋即食','2021-04-27 11:53:20','2021-04-27 11:53:35'),
('5','22','中国湖北武汉','12个月','威龙','贤磊咪咪虾条有限责任公司','湖北武汉江夏区光谷大道77号','袋装','50g','常温保存','开袋即食','2021-04-27 11:53:20','2021-04-27 11:53:35'),
('6','23','中国湖北武汉','12个月','老干妈','贤磊咪咪虾条有限责任公司','湖北武汉江夏区光谷大道77号','袋装','50g','常温保存','开袋即食','2021-04-27 11:53:20','2021-04-27 11:53:35'),
('7','24','中国湖北武汉','12个月','卫龙','贤磊咪咪虾条有限责任公司','湖北武汉江夏区光谷大道77号','袋装','50g','常温保存','开袋即食','2021-04-27 11:53:20','2021-04-27 11:53:35'),
('8','1','中国湖北武汉','12个月','良品铺子','贤磊咪咪虾条有限责任公司','湖北武汉江夏区光谷大道77号','袋装','50g','常温保存','开袋即食','2021-04-27 11:53:20','2021-04-27 11:53:35');

-- ----------------------------
-- Table structure for product_sku
-- ----------------------------
DROP TABLE IF EXISTS `product_sku`;
CREATE TABLE `product_sku` (
       `sku_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'sku编号',
       `product_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品id',
       `sku_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'sku名称',
       `sku_img` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'sku图片',
       `untitled` varchar(400) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '属性组合（格式是p1:v1;p2:v2）',
       `original_price` int DEFAULT NULL COMMENT '原价',
       `sell_price` int NOT NULL COMMENT '销售价格',
       `discounts` decimal(4,2) DEFAULT NULL COMMENT '折扣力度',
       `stock` int NOT NULL COMMENT '库存',
       `create_time` datetime DEFAULT NULL COMMENT '创建时间',
       `update_time` datetime DEFAULT NULL COMMENT '更新时间',
       `status` int DEFAULT NULL COMMENT 'sku状态(1启用，0禁用，-1删除)',
       PRIMARY KEY (`sku_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='商品规格 每一件商品都有不同的规格，不同的规格又有不同的价格和优惠力度，规格表为此设计';
-- ----------------------------
-- Records of product_sku
-- ----------------------------
INSERT INTO mall.product_sku (sku_id,product_id,sku_name,sku_img,untitled,original_price,sell_price,discounts,stock,create_time,update_time,status)
VALUES
('1','3','咪咪虾条 单包 50g','mmxt_1.png','{口味:["原味","烧烤","芥末"],包装:["盒装","袋装"]}',2,1,0.70,316,'2021-04-26 15:58:00','2021-04-25 15:58:00',1),
('10','24','加力加 100g','jlj_1.png','{口味:["原味","微辣","BT"]}',3,2,0.50,999,'2021-05-10 09:56:09','2021-05-10 09:56:12',1),
('11','25','加力加 100g','jlj_1.png','{口味:["原味","微辣","BT"]}',3,2,0.50,999,'2021-05-10 09:56:09','2021-05-10 09:56:12',1),
('12','26','加力加 100g','jlj_1.png','{口味:["原味","微辣","BT"]}',3,2,0.50,999,'2021-05-10 09:56:09','2021-05-10 09:56:12',1),
('13','27','加力加 100g','jlj_1.png','{口味:["原味","微辣","BT"]}',3,2,0.50,999,'2021-05-10 09:56:09','2021-05-10 09:56:12',1),
('14','28','加力加 100g','jlj_1.png','{口味:["原味","微辣","BT"]}',3,2,0.50,999,'2021-05-10 09:56:09','2021-05-10 09:56:12',1),
('15','29','加力加 100g','jlj_1.png','{口味:["原味","微辣","BT"]}',3,2,0.50,999,'2021-05-10 09:56:09','2021-05-10 09:56:12',1),
('16117777','62087398',NULL,NULL,NULL,NULL,159,NULL,123,NULL,NULL,1),
('16443529','16302465',NULL,NULL,NULL,NULL,59,NULL,1000,NULL,NULL,1),
('19265527','81759814',NULL,NULL,NULL,NULL,100,NULL,5000,NULL,NULL,1);
INSERT INTO mall.product_sku (sku_id,product_id,sku_name,sku_img,untitled,original_price,sell_price,discounts,stock,create_time,update_time,status)
VALUES
('2','3','咪咪虾条 6连包','mmxt_1.png','{口味:["原味","烧烤"],包装:["新包装","老包装"]}',6,5,0.60,171,'2021-04-26 14:48:21','2021-04-26 14:48:25',1),
('25175381','25031649',NULL,NULL,NULL,NULL,10,NULL,123,NULL,NULL,1),
('26455908','37437797',NULL,NULL,NULL,NULL,18,NULL,123,NULL,NULL,1),
('27140116','26990382',NULL,NULL,NULL,NULL,40,NULL,1000,NULL,NULL,1),
('29768327','80836525',NULL,NULL,NULL,NULL,5499,NULL,999,NULL,NULL,1),
('2980963','2840370',NULL,NULL,NULL,NULL,13,NULL,11,NULL,NULL,1),
('3','3','咪咪虾条 整箱50包','mmxt_1.png','{口味:["原味","烧烤","孜然"]}',50,40,0.50,37,'2021-04-26 14:49:20','2021-04-26 14:49:23',1),
('31061668','30692436',NULL,NULL,NULL,NULL,10,NULL,100,NULL,NULL,1),
('32214301','64967901',NULL,NULL,NULL,NULL,16999,NULL,1000,NULL,NULL,1),
('34949944','34793911',NULL,NULL,NULL,NULL,10,NULL,100,NULL,NULL,1);
INSERT INTO mall.product_sku (sku_id,product_id,sku_name,sku_img,untitled,original_price,sell_price,discounts,stock,create_time,update_time,status)
VALUES
('4','1','奥利奥分享装','ala_1.png','{口味:["草莓","巧克力","牛奶","原味"]}',10,8,0.80,137,'2021-04-27 11:38:55','2021-04-27 11:39:00',1),
('42180569','95595959',NULL,NULL,NULL,NULL,8988,NULL,5,NULL,NULL,1),
('42276740','42122875',NULL,NULL,NULL,NULL,10,NULL,13,NULL,NULL,1),
('5','19','加力加 100g','jlj_1.png','{口味:["原味","微辣","BT"]}',3,2,0.50,999,'2021-05-10 09:56:09','2021-05-10 09:56:12',1),
('54313881','54170782',NULL,NULL,NULL,NULL,29,NULL,123,NULL,NULL,1),
('6','20','加力加 100g','jlj_1.png','{口味:["原味","微辣","BT"]}',3,2,0.50,999,'2021-05-10 09:56:09','2021-05-10 09:56:12',1),
('6037983','8653137',NULL,NULL,NULL,NULL,149,NULL,2526,NULL,NULL,1),
('6183901','6033768',NULL,NULL,NULL,NULL,98,NULL,98,NULL,NULL,1),
('63223929','63031777',NULL,NULL,NULL,NULL,24,NULL,1000,NULL,NULL,1),
('69466429','19561127',NULL,NULL,NULL,NULL,4999,NULL,997,NULL,NULL,1);
INSERT INTO mall.product_sku (sku_id,product_id,sku_name,sku_img,untitled,original_price,sell_price,discounts,stock,create_time,update_time,status)
VALUES
('7','21','加力加 100g','jlj_1.png','{口味:["原味","微辣","BT"]}',3,2,0.50,999,'2021-05-10 09:56:09','2021-05-10 09:56:12',1),
('71802836','71662231',NULL,NULL,NULL,NULL,189,NULL,123,NULL,NULL,1),
('75581249','75436070',NULL,NULL,NULL,NULL,100,NULL,100,NULL,NULL,1),
('76620727','66232947',NULL,NULL,NULL,NULL,6999,NULL,997,NULL,NULL,1),
('78033086','77885075',NULL,NULL,NULL,NULL,12,NULL,123,NULL,NULL,1),
('8','22','加力加 100g','jlj_1.png','{口味:["原味","微辣","BT"]}',3,2,0.50,999,'2021-05-10 09:56:09','2021-05-10 09:56:12',1),
('80022159','79875193',NULL,NULL,NULL,NULL,12,NULL,2343,NULL,NULL,1),
('81444046','3590577',NULL,NULL,NULL,NULL,11,NULL,11,NULL,NULL,1),
('84070005','6432001',NULL,NULL,NULL,NULL,1000,NULL,9990,NULL,NULL,1),
('86366975','86223418',NULL,NULL,NULL,NULL,132,NULL,100,NULL,NULL,1);
INSERT INTO mall.product_sku (sku_id,product_id,sku_name,sku_img,untitled,original_price,sell_price,discounts,stock,create_time,update_time,status)
VALUES
('87179212','87006304',NULL,NULL,NULL,NULL,60,NULL,998,NULL,NULL,1),
('9','23','加力加 100g','jlj_1.png','{口味:["原味","微辣","BT"]}',3,2,0.50,999,'2021-05-10 09:56:09','2021-05-10 09:56:12',1),
('94828632','52363235',NULL,NULL,NULL,NULL,8999,NULL,999,NULL,NULL,1),
('95644198','18554393',NULL,NULL,NULL,NULL,14799,NULL,3985,NULL,NULL,1),
('97673059','25959471',NULL,NULL,NULL,NULL,8999,NULL,1000,NULL,NULL,1),
('98446027','68569563',NULL,NULL,NULL,NULL,11,NULL,1110,NULL,NULL,1);

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
CREATE TABLE `shopping_cart` (
         `cart_id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
         `product_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品ID',
         `sku_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'skuID',
         `user_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户ID',
         `cart_num` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '购物车商品数量',
         `cart_time` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '添加购物车时间',
         `product_price` decimal(32,8) DEFAULT NULL COMMENT '添加购物车时商品价格',
         `sku_props` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '选择的套餐的属性',
         PRIMARY KEY (`cart_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='购物车 ';
-- ----------------------------
-- Records of shopping_cart
-- ----------------------------
INSERT INTO mall.shopping_cart (product_id,sku_id,user_id,cart_num,cart_time,product_price,sku_props)
VALUES
('32187642','67369225','6','1','2021-12-30 06:31:41',100.00000000,NULL),
('31746426','32138688','2','1','2021-12-30 09:43:36',100.00000000,NULL),
('31746426','32138688','1','1','2021-12-30 10:47:06',100.00000000,NULL),
('18554393','23010839','4','1','2021-12-31 03:41:55',14799.00000000,NULL),
('18554393','23010839','1','1','2022-01-02 06:45:11',14799.00000000,NULL),
('87006304','87179212','10','1','2022-01-02 09:36:19',60.00000000,NULL),
('8653137','6037983','2','1','2022-01-03 08:10:41',149.00000000,NULL),
('18554393','95644198','2','1','2023-07-02 11:18:53',14799.00000000,NULL);

-- ----------------------------
-- Table structure for shoptable
-- ----------------------------
DROP TABLE IF EXISTS `shoptable`;
CREATE TABLE `shoptable` (
     `shop_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
     `shop_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
     `shopkeeper_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
     `shopkeeper_name` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
     `shop_description` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
     `shop_img` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
     `status` int DEFAULT NULL,
     PRIMARY KEY (`shop_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
-- ----------------------------
-- Records of shoptable
-- ----------------------------
INSERT INTO mall.shoptable (shop_id,shop_name,shopkeeper_id,shopkeeper_name,shop_description,shop_img,status)
VALUES
('1','好利来1','1','123','经济实惠',NULL,1),
('22432443','好利来','2','admin','好',NULL,1),
('3','好利来3','3','HQF3','经济实惠',NULL,1),
('32272500','zyy的廉价店铺','6','zyy','价格实惠',NULL,1),
('32554047','123','14','123','123',NULL,1),
('37599754','444的小店','8','zyy','444的小小小店',NULL,1),
('38872933','zxf的小店','13','zxf','欢迎光临本店，本店新开张，诚信经营，只赚信誉不赚钱，谢谢。',NULL,1),
('42248482','今吃网','15','李伟','今天吃啥，上今吃网！',NULL,1),
('50085027','好名字','4','aaa','好',NULL,1),
('50574924','zyy的小吃店','12','zyy','专卖鸭脖',NULL,1);
INSERT INTO mall.shoptable (shop_id,shop_name,shopkeeper_id,shopkeeper_name,shop_description,shop_img,status)
VALUES
('61949229','万德隆购物商店','10','江晨','买的东西包括衣服、吃的、用的',NULL,1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
    `user_id` int NOT NULL AUTO_INCREMENT,
    `username` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
    `password` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
    `nickname` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
    `realname` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
    `user_Img` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
    `user_mobile` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
    `user_email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
    `user_sex` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
    `user_birth` datetime DEFAULT NULL,
    `user_regtime` datetime DEFAULT NULL,
    `isAdmin` tinyint(1) DEFAULT NULL,
    `isShopKeeper` tinyint(1) DEFAULT NULL,
    `isVIP` tinyint(1) DEFAULT NULL,
    `user_address` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
    PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO mall.`user` (username,password,nickname,realname,user_Img,user_mobile,user_email,user_sex,user_birth,user_regtime,isAdmin,isShopKeeper,isVIP,user_address)
VALUES
('123','d9b1d7db4cd6e70935368a1efb10e377','123','jh','img/ani36_2021123100400551534461.jpg','13065859690','1234567@qq.com','男',NULL,NULL,1,1,1,'幻想乡'),
('admin','c3284d0f94606de1fd2af172aba15bf3','admin','你爹','img/36dfe30867cdbcd5_2023070222322777368964.jpeg','13188888888','1234567@qq.com','男',NULL,NULL,1,1,1,'幻想乡'),
('111','698d51a19d8a121ce581499d7b701668','111','zyy','img/ani37_2021123101044444381266.jpg','12345456','1234567@qq.com','男',NULL,NULL,0,1,1,'江西省南昌市南昌大学前湖校区'),
('222','bcbe3365e6ac95ea2c0343a2395834dd','222','zyy','img/ani52_2021123100543441872855.jpg','12345678909','123456@qq.com','男',NULL,NULL,0,1,1,'江西省南昌市南昌大学前湖校区'),
('333','310dcbbf4cce62f762a2aaa148d556bd','userdb6a206a07',NULL,'img/default.png',NULL,NULL,NULL,NULL,NULL,0,0,0,NULL),
('444','550a141f12de6341fba65b0ad0433500','user7558c98d6c',NULL,'img/default.png',NULL,NULL,NULL,NULL,NULL,0,1,0,NULL),
('gjl','202cb962ac59075b964b07152d234b70','xsgkkadsf','gjl','img/tutu_2022010320401881787784.png','13217065163','2642440908@qq.com','男',NULL,NULL,0,0,1,'南昌市南昌大学'),
('111111','96e79218965eb72c92a549dd5a330112','user772024c825',NULL,'img/default.png',NULL,NULL,NULL,NULL,NULL,0,1,1,NULL),
('555','15de21c670ae7c3f6f3f1f37029303c9','user519ad144b0',NULL,'img/default.png',NULL,NULL,NULL,NULL,NULL,0,1,0,NULL),
('zxf','e10adc3949ba59abbe56e057f20f883e','user61d11a1e6e','zxf','img/default.png','17879632526','2311997861@qq.com',NULL,NULL,NULL,0,1,0,'南昌');
INSERT INTO mall.`user` (username,password,nickname,realname,user_Img,user_mobile,user_email,user_sex,user_birth,user_regtime,isAdmin,isShopKeeper,isVIP,user_address)
VALUES
('123456','202cb962ac59075b964b07152d234b70','123','123','img/tou_ xiang_2022010322082339823975.jpg','13307911234','1234567@qq.com','女',NULL,NULL,0,1,0,'江西省'),
('123','202cb962ac59075b964b07152d234b70','userbb274ab7e2',NULL,'img/default.png',NULL,NULL,NULL,NULL,NULL,0,1,0,NULL),
('jinhui','9693aee83a32be1ba3ca3a4761adcd77','userd366a8e651','123','img/default.png','13065859690','123@123.com',NULL,NULL,NULL,0,0,1,'123');


SET FOREIGN_KEY_CHECKS = 1;
