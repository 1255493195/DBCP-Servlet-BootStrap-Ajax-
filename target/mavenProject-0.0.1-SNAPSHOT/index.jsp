<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

		.navbar-brand{
			padding:4px 15px;
		}	
		

	</style>
</head>

<body>

	
	<nav class="navbar-inverse navbar-default">
  <div class="container">
    
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#"><img alt="" src="img/QST.png"></a>
    </div>   
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">实训教育 <span class="sr-only">(current)</span></a></li>
        <li><a href="#">教学管理</a></li>
      	<li><a href="#">规章制度</a></li>
      	<li><a href="#">班级管理</a></li>
      	<li><a href="#">校园招聘</a></li>
      	<li><a href="#">企业文化</a></li>
      	<li><a style="color:white;">欢迎${username }登录管理系统</a></li>
      </ul>
      
      
      <form class="navbar-form navbar-right">
      
        <div class="col-lg-6">
    <div class="input-group" style="width:230px;">
      <input type="text" class="form-control" placeholder="Search for...">
      <span class="input-group-btn">
        <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
      </span>
    </div><!-- /input-group -->
  </div>  
      </form>
      
    </div>
  </div>
</nav>
<div class="container">
<div class="alert alert-danger alert-dismissible in hide" role="alert" id="deletemsg">
      <h4>提示信息</h4>
      <p>确定要删除该用户吗？</p>
      <p>
        <button type="button" class="btn btn-danger" id="yesyes">确定</button>
        <button type="button" class="btn btn-default" id="nono">取消</button>
      </p>
    </div>
    <div class="table-responsive">
  <table class="table table-striped table-bordered table-hover">
  	<tr>
  		<th>ID</th>
  		<th>用户名</th>
  		<th>密码</th>
  		<th>地址</th>
  		<th>电话</th>
  		<th>邮箱</th>
  		<th>操作：<a class="btn btn-primary" href="${pageContext.request.contextPath}/queryServlet" id="seall">查询所有用户信息</a>
  				  <a class="btn btn-success" href="add.jsp">添加用户</a>
  		</th>
  	</tr> 	
<c:forEach items="${users }" var="i">
  <tr id="tbody">
  		<td>${i.uid }</td>
  		<td>${i.username }</td>
  		<td>${i.password }</td>
  		<td>${i.address }</td>
  		<td>${i.tel }</td>
  		<td>${i.email }</td>
  		<td>
			<div class="btn-group" role="group" aria-label="...">
			  <button type="button" class="btn btn-default" href="">编辑</button>
			  <button type="button" class="btn btn-default" style="color:red;" onclick="deleteUser(${i.uid})">删除</button>
			</div>
		</td>
  	</tr>
  	</c:forEach>

  </table>
  
  </div>
 
  <script type="text/javascript">
  	function deleteUser(uids){
  		uid = uids;
  		$('#deletemsg').attr("class","alert alert-danger alert-dismissible");
  	}
  	$('#nono').click(function(){
  		$('#deletemsg').attr("class","hide"); 		
  	});
  	$('#yesyes').click(function(){
  		$.post("${pageContext.request.contextPath}/deleteServlet",
  				{"uid":uid},
  				function(delet){
  					window.location.href="${pageContext.request.contextPath}/queryServlet";
  					
  				})
  	});
  </script>
</body>

</html>