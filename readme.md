# 启动项目



- 所需环境：NodeJs、JDK11、MySQL、IDEA
- 建议安装：Git（代码管理）、Navicat或者dBeaver（数据库管理）

## web端

请确保安装好了NodeJs环境，并在`shop-rope/vueshopping/mall`下输入如下命令：

1. 安装所需依赖

```shell
npm install
```

2. 启动前端

```shell
npm run serve
```

若终端出现以下信息，并且能在浏览器中成功显示http://localhost:8081/页面，说明前端启动成功

![image-20230703162218089](https://adguycn990-typoraimage.oss-cn-hangzhou.aliyuncs.com/202307031622122.png)

## 后端

请确保安装了JDK11「可以用IDEA直接装」、IDEA以及MySQL。

1. 加载所需依赖

![image-20230703162621742](https://adguycn990-typoraimage.oss-cn-hangzhou.aliyuncs.com/202307031632601.png)

2. 配置数据库
3. 
![image-20230703162823033](https://adguycn990-typoraimage.oss-cn-hangzhou.aliyuncs.com/202307031632120.png)

点击该文件，即可发现如下数据：

```yaml
  datasource:
    username: root
    password: jinhui123
    url: jdbc:mysql://127.0.0.1:3306/mall?useUnicode=true&characterEncoding=utf-8&serverTimezone=GMT%2b8&sessionVariables=sql_mode='NO_ENGINE_SUBSTITUTION'&jdbcCompliantTruncation=false&zeroDateTimeBehavior=convertToNull
    driver-class-name: com.mysql.cj.jdbc.Driver
```

请根据本地环境进行相对应的修改，以我的为例：数据库用户是`root`，用户密码是`jinhui123`，数据库名称是`mall`。

配置好数据库后就可执行建表语句了，参考这个文件：

![image-20230703163237805](https://adguycn990-typoraimage.oss-cn-hangzhou.aliyuncs.com/202307031633011.png)

根据SQL脚本创建完数据后，可通过数据库管理软件查看数据库。应当有这些数据表，且每个数据表中都应有相关数据。

![image-20230703172349976](https://adguycn990-typoraimage.oss-cn-hangzhou.aliyuncs.com/202307031727627.png)

3. 启动后端服务

找到` ShoppingApplication.java `这个文件，使其运行起来。在控制台中看到如下信息就表示后端服务启动成功：

![image-20230703172715423](https://adguycn990-typoraimage.oss-cn-hangzhou.aliyuncs.com/202307031727918.png)

## 验证

此时可以返回前端的网页，随便点点看看是否能够操作成功：http://localhost:8081/#/index


# 顾客模块

- 登入网站
- 浏览网站内容
- 注册此网站会员
- 将选中的商品胶乳购物车
- 对购买后的商品进行评价
# 商家模块
- 注册申请开店
- 都自己的点进行管理(包括上传商品图片，对图片进行介绍等)
# 管理员模块
- 对商家进行管理
- 对系统进行维护

## 注：不需要完成真是付款/物流等功能，只需要有相关操作即可