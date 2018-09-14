<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
	response.addHeader("Cache-control", "No-cache");
	response.addDateHeader("Expires", 0);
	request.setAttribute("ctx",request.getContextPath());
	String timeout = request.getParameter("timeout");
	request.setAttribute("timeout", timeout);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="${ctx}/static/css/login.css" rel="stylesheet" type="text/css" />
<style>

</style>
<title>登录页面</title>
	<script>
	var ctx="${ctx}";  // 定义全局变量
	var timeout = "${timeout}";  // session超时标志

	$(function(){
		if(timeout!=undefined && timeout == 'true'){
			$.messager.alert('提示',"您已登出，请重新登录！",'info',function(){
				top.location.href = "${ctx}/login.jsp";
			});
			return;
		}
		var sysWith = window.screen.availWidth;
		var sysHeight = window.screen.availHeight;
		if(sysWith <= 1024){
			$(".logn_frame").css("right","100px")
		}
		if ("${message}" != "") {
			$.messager.alert('提示',"${message}",'info');
		}
		$("#loginName").bind("focus", function(e) {
			$("label[name='label_001']").css("display", "none")
		});
		$("#loginName").bind("blur", function(e) {
			if ($.trim($(this).val()) == '') {
				$(this).val("");
				$("label[name='label_001']").css("display", "block");
			}
		});
		$("#password").bind("focus", function(e) {
			$("label[name='label_002']").css("display", "none")
		});
		$("#password").bind("blur", function(e) {
			if ($.trim($(this).val()) == '') {
				$(this).val("");
				$("label[name='label_002']").css("display", "block")
			}
		});
		$("#password").bind("change", function(e) {
			if ($.trim($(this).val()) != '') {
				$("label[name='label_002']").css("display", "none");
			}
		});
		$("#loginName").bind("keyup", function(e) {
			if ($.trim($(this).val()) == '') {
				$("label[name='label_002']").css("display", "block");
			} else {
				$("label[name='label_001']").css("display", "none")
			}
			// 密码
			if ($.trim($("#password").val()) == '') {
				$("label[name='label_002']").css("display", "block")
			} else {
				$("label[name='label_002']").css("display", "none")
			}
		});
		$("input[type='submit']").bind("mouseover", function(e) {
			$(this).removeClass("logn_btn_focus");
			$(this).addClass("logn_btn_blur");
		});
		$("input[type='submit']").bind("mouseout", function(e) {
			$(this).addClass("logn_btn_focus");
			$(this).removeClass("logn_btn_blur");
		});
	})
	function checkForm(loginform) {
		if (loginform.loginName.value == "") {
			alert("请输入登录名！");
			loginform.loginName.focus();
			return false;
		}
		if (loginform.password.value == "") {
			alert("请输入密码！");
			loginform.password.focus();
			return false;
		}
		if (loginform.kaptchaCode.value == "") {
            alert("请输入验证码！");
            loginform.kaptchaCode.focus();
            return false;
        }
		return true;
	}
	</script>
</head>
	<body>
		<div class="login_header">
			<span class="left"><img src="${ctx}/images/logn_logo1.png" style="margin:25px 0px 25px 100px;" /> </span>
			<span class="right" style="font-size : 12px">
				<p>
					<a href="http://down10b.zol.com.cn/zhuyeliulan/CHSB_Chrome_non_defaultV5.exe"
					class="easyui-linkbutton" plain="true" iconCls="icon-ie">推荐浏览器</a>
				</p>
			</span>
			<div class="clear"></div>
		</div>
		<div class="login_central">
		<form id="form1" method="post" action='${ctx}/login/check' onsubmit="return checkForm(this)">
			<input type="hidden" name="clientTime" id="clientTime"/>
			<div class="logn_frame">
				<table class="table_logn" cellpadding="0" cellspacing="0">
					<tr height="40">
						<td>
							<input id="loginName" name="loginName" type="text" class="input_name" />
						</td>
					</tr>
					<tr height="30">
						<td>
							<input id="password" name="password" type="password" class="input_name" />
						</td>
					</tr>
					<tr height="30">
                        <td>
                            <input id="kaptchaCode" name="kaptchaCode" type="text" class="kaptcha_code"/>
                            <img alt="验证码" onclick = "this.src='${ctx}/kaptcha?d='+new Date()*1" src="/kaptcha" class="kaptcha"/>
                        </td>
                    </tr>
					<tr height="30">
						<td>
							<input name="" type="submit" class="logn_btn logn_btn_focus" value="登录" />
						</td>
					</tr>
				</table>
				<div class="login_wechat" align="center">
					<span class="left"><img src="${ctx}/static/images/yzjiang_weixin.jpg" style="width: 90px"/></span>
					<span class="left">
						<p>用微信扫描左侧二维码<br>关注个人公众号</p>
					</span>
					<div class="clear"></div>
				</div>
			</div>
		</form>
		</div>
		<div class="login_bottom">
			<span class="login_bottom_copyright left">
				个人网站&nbsp;版权所有&nbsp;Copyright © 2017-2020 All
				Rights Reserved </span>
			<span class="right">低碳出行&nbsp;&nbsp;智慧服务 <font style="font-family: Arial">We Move Faster</font></span>
			<div class="clear"></div>
		</div>
	</body>
</html>
