package com.learn.yzjiang.login.web;

import com.learn.yzjiang.common.Constants;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * 登录Controller
 */
@Controller
@RequestMapping(value = "/login")
public class LoginController {

    @RequestMapping(value = "/open")
    public String loginOpen() {
        return "login";
    }


    @RequestMapping(value = "/check")
    public String login(HttpServletRequest request, String loginName, String password, String kaptchaCode) {
        String captcha = (String) request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
        request.getSession().removeAttribute(Constants.KAPTCHA_SESSION_KEY);
        System.out.println("loginName="+loginName+",password="+password+"，captcha="+captcha+",kaptcha="+ kaptchaCode);

        return "index";
    }


}
