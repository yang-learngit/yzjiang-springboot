package com.learn.yzjiang.kaptcha;

import com.google.code.kaptcha.Producer;
import com.learn.yzjiang.common.Constants;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;

@Controller
@RequestMapping("/kaptcha")
public class KaptchaController {

    private final Producer kaptchaProducer;

    public KaptchaController(
            Producer kaptchaProducer) {
        this.kaptchaProducer = kaptchaProducer;
    }

    /**
     * 生成验证码信息
     */
    @RequestMapping("")
    public void generateVerifyCode(HttpServletResponse response, HttpSession session) throws Exception {
        response.setDateHeader("Expires", 0);
        // Set standard HTTP/1.1 no-cache headers.
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        // Set IE extended HTTP/1.1 no-cache headers (use addHeader).
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");
        // Set standard HTTP/1.0 no-cache header.
        response.setHeader("Pragma", "no-cache");

        // return a jpeg
        response.setContentType("image/jpeg");

        ImageIO.setUseCache(false);

        // create the text for the image
        String capText = kaptchaProducer.createText();

        // store the text in the session
        session.setAttribute(Constants.KAPTCHA_SESSION_KEY, capText);

        // create the image with the text
        BufferedImage bi = kaptchaProducer.createImage(capText);

        try (ServletOutputStream out = response.getOutputStream()) {
            ImageIO.write(bi, "jpg", out);
            out.flush();
        } catch (IOException e) {
            throw new Exception("获取验证码错误", e);
        }
    }

}
