package com.learn.yzjiang;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

//@SpringBootApplication(scanBasePackages = "com.learn.yzjiang")  //自定义扫描代码包路径
//@EnableDubboConfiguration  //使用dubbo配置
@SpringBootApplication
public class YzjiangApplication {

    public static void main(String[] args) {
        SpringApplication.run(YzjiangApplication.class, args);
    }
}
