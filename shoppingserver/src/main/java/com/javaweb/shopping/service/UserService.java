package com.javaweb.shopping.service;


import com.javaweb.shopping.vo.ResultVO;


public interface UserService {
    //用户注册
    ResultVO userResgit(String name, String pwd);

    //用户登录
    ResultVO checkLogin(String name, String pwd);


}
