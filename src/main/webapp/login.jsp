<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>登录</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="bootstrap-3.3.7-dist/jquery.min.js"></script>
	<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<style type="text/css">
	body {
			background: url(img/miku.png) no-repeat;
			 -webkit-background-size: cover;
		}

		header {
			display: -webkit-box;
			position: absolute;
			background: -webkit-linear-gradient(top, #6495ED, rgba(100, 149, 237, 0.3));
			width: 100%;
			/* margin-top:-8px;
			margin-left:-8px; */

			border-bottom: 1px solid #8B8B7A;

			height: 75px;
			-webkit-box-pack: center;
			-webkit-box-align: center;

			/* padding-top:15px; */
		}
		
		.htext {
			color: #E6E6FA;
			text-align: center;
			font-size: 30px;
			letter-spacing: 30px;
			margin-top: 15px;
			font-family:'黑体', Times, serif;
		}
		.container1 {
			width: 30%;
			height: 60%;
			background: rgba(100, 149, 237, 0.6);
			/* position: absolute; */
			position: absolute;
			left: 50%;
			top:50%;
			transform: translate(-50%, -50%);
			box-shadow: 0 0 15px #D8BFD8;
		}

		
		.fcenter{
			display: -webkit-box;
			width:100%;
			height:60%;
			margin-top:18%;
			/* margin-left:25%; */
			-webkit-box-pack: center;
			-webkit-box-align: center;
		}
		
		label{
			font-size:18px;
			color:#FFDAB9;
			letter-spacing:3px;
		}
		
		.typesize{
			height:50px;
			width:100%;
		
		}
		
		h3{
			text-align:center;
			margin-bottom:10%;
			letter-spacing:7px;
			color:#fff;
			font-family:'宋体', Times, serif;
		}
		
		.button{
			background:#8FBC8F;
			border:none;
			width:80px;
			height:40px;
			text-align:center;
			color:#fff;
			letter-spacing:5px;
			font-size:15px;
			border-radius: 15px;
			margin-top:10px;
		}
		.button:hover{
			background:#228B22;
			transition:background .4s;
		
		}
		.zhuce{
			background:#DAA520;
			margin:auto 0px auto 36px;
		
		}
		
		.zhuce:hover{
			background:#D2691E;
			transition:background .4s;
		}
		
		
		
		.intext{
			background:rgba(255,255,255,0.7);
			
		}
	
	</style>
</head>

<body>

	<header><div class="htext">登录</div></header>
	<div class="container1">
		
		<div class="center">
		
		<div class="fcenter">
		<form action="<%=request.getContextPath()%>/loginServlet" class="form-horizontal">
		<h3>管理系统</h3>
			<div class="form-group"><label class="control-label">用户名：</label>
			<div class="typesize">
			<input type="text" class="form-control intext" name="username" id="username" placeholder="请输入用户名"/>
			</div>
			</div>
			<div class="form-group"><label class="control-label">密码：</label>
			<div class="typesize">
			<input type="password" class="form-control intext" name="password" id="password" placeholder="请输入密码"/>
			</div>
			</div>
			<input type="submit" value="登录" class="button"/>
			<a href="req.jsp"><input type="button" value="注册" class="button zhuce"/></a>
			
		</form>
		
		</div>	
		</div>
	</div>

</body>

</html>