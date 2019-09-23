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
		.form-control{
			width:130px;
		}
		.id{
			width:120px;
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
  				  <button type="button" class="btn btn-success"  onclick="addUser()">添加用户</button>
  		</th>
  	</tr> 	
  	<tbody id="tbody">
  	<tr id="addtr" class="hide">
  		<td><input type="text" class="form-control id" placeholder="请输入用户id" id="uid"/></td>
  		<td><input type="text" class="form-control id" placeholder="请输入用户名" id="username"/></td>
  		<td><input type="text" class="form-control id" placeholder="请输入密码" id="password"/></td>
  		<td><input type="text" class="form-control" placeholder="请输入地址" id="address"/></td>
  		<td><input type="text" class="form-control id" placeholder="请输入电话" id="tel"/></td>
  		<td><input type="text" class="form-control" placeholder="请输入邮箱" id="email"/></td>
  		<td>
			<div class="btn-group" role="group" aria-label="...">
			  <button type="button" class="btn btn-default" onclick="addNewUser()">添加</button>
			  <button type="button" class="btn btn-default" style="color:red;" onclick="noadd()">取消</button>
			</div>
		</td>
		
  	</tr>

<c:forEach items="${users }" var="i">
  <tr id=${i.uid }>
  		<td>${i.uid }</td>
  		<td>${i.username }</td>
  		<td>${i.password }</td>
  		<td>${i.address }</td>
  		<td>${i.tel }</td>
  		<td>${i.email }</td>
  		<td>
			<div class="btn-group" role="group" aria-label="...">
			  <button type="button" class="btn btn-default" onclick="editUser('${i.uid}','${i.username}','${i.password}','${i.address}','${i.tel}','${i.email}')">编辑</button>
			  <button type="button" class="btn btn-default" style="color:red;" onclick="deleteUser(${i.uid})">删除</button>
			</div>
		</td>
  	</tr>
  	</c:forEach>
</tbody>
  </table>
  
  </div>
 </div>
  <script type="text/javascript">
  //添加
  function addUser(){
	  $('#addtr').attr("class","");  
  }
  function noadd(){
	  $('#addtr').attr("class","hide");
	  
  }
  function addNewUser(){
	  var uid = $('#uid').val();
	  var username = $('#username').val();
	  var password = $('#password').val();
	  var address = $('#address').val();
	  var tel = $('#tel').val();
	  var email = $('#email').val();
		$.ajax({
  			url:'${pageContext.request.contextPath}/ReqServlet',
  			type:'post',
  			data:{
  				"flag":"add",
  				"uid":uid,
  				"username":username,
  				"password":password,
  				"address":address,
  				"tel":tel,
  				"email":email	
  			},
  			error:function(data){
  				$('#addtr').attr("class","hide");	
  				alert('添加失败');
  			},
  			success:function(data){
  				$('#addtr').attr("class","hide"); 	
  				$.post("${pageContext.request.contextPath}/queryServlet",{"flag":"addfresh"},function(data){
  					var str = "";
  	  				$('#tbody').html("");
  	  				$('#tbody').append("<tr id=\"addtr\" class=\"hide\"><td><input type=\"text\" class=\"form-control id\" placeholder=\"请输入用户id\" id=\"uid\"/></td><td><input type=\"text\" class=\"form-control id\" placeholder=\"请输入用户名\" id=\"username\"/></td><td><input type=\"text\" class=\"form-control id\" placeholder=\"请输入密码\" id=\"password\"/></td><td><input type=\"text\" class=\"form-control\" placeholder=\"请输入地址\" id=\"address\"/></td><td><input type=\"text\" class=\"form-control id\" placeholder=\"请输入电话\" id=\"tel\"/></td><td><input type=\"text\" class=\"form-control\" placeholder=\"请输入邮箱\" id=\"email\"/></td><td><div class=\"btn-group\" role=\"group\" aria-label=\"...\"><button type=\"button\" class=\"btn btn-default\" onclick=\"addNewUser()\">添加</button><button type=\"button\" class=\"btn btn-default\" style=\"color:red;\" onclick=\"noadd()\">取消</button></div></td>	</tr>");
  	  				var json = JSON.parse(data);
  	  				for(var i = 0;i<json.length;i++){
  	  					str = "<tr>"+
  	  						  "<td>"+json[i].uid+"</td>"+
  	  						  "<td>"+json[i].username+"</td>"+
  	  						  "<td>"+json[i].password+"</td>"+
  	  						  "<td>"+json[i].address+"</td>"+
  	  						  "<td>"+json[i].tel+"</td>"+
  	  						  "<td>"+json[i].email+"</td>"+
  	  						 "<td><div class=\"btn-group\" role=\"group\" aria-label=\"...\"><button type=\"button\" class=\"btn btn-default\" onclick=\"editUser("+json[i].uid+")\">编辑</button><button type=\"button\" class=\"btn btn-default\" style=\"color:red;\" onclick=\"deleteUser("+json[i].uid+")\">删除</button></div></td>"+
  	  						  "</tr>"; 	  						  
  	  						  $('#tbody').append(str);
  	  				}  	  				
  				}); 				
  			} 			
  		});	  
  }
  //删除
  	function deleteUser(uids){
  		uid = uids;
  		$('#deletemsg').attr("class","alert alert-danger alert-dismissible");
  	}
  	$('#nono').click(function(){
  		$('#deletemsg').attr("class","hide"); 		
  	});
  	$('#yesyes').click(function(){
/*   		$.post("${pageContext.request.contextPath}/deleteServlet",
  				{"uid":uid},
  				function(delet){
  					window.location.href="${pageContext.request.contextPath}/queryServlet";
  				}); */
  		$.ajax({
  			url:'${pageContext.request.contextPath}/deleteServlet',
  			type:'post',
  			data:{
  				"uid":uid
  			},
  			error:function(data){
  				$('#deletemsg').attr("class","hide"); 	
  				alert('请求失败');
  			},
  			success:function(data){
  				$('#deletemsg').attr("class","hide"); 	
  				$.post("${pageContext.request.contextPath}/queryServlet",{"flag":"addfresh"},function(data){
  					var str = "";
  	  				$('#tbody').html("");
  	  	  			$('#tbody').append("<tr id=\"addtr\" class=\"hide\"><td><input type=\"text\" class=\"form-control id\" placeholder=\"请输入用户id\" id=\"uid\"/></td><td><input type=\"text\" class=\"form-control id\" placeholder=\"请输入用户名\" id=\"username\"/></td><td><input type=\"text\" class=\"form-control id\" placeholder=\"请输入密码\" id=\"password\"/></td><td><input type=\"text\" class=\"form-control\" placeholder=\"请输入地址\" id=\"address\"/></td><td><input type=\"text\" class=\"form-control id\" placeholder=\"请输入电话\" id=\"tel\"/></td><td><input type=\"text\" class=\"form-control\" placeholder=\"请输入邮箱\" id=\"email\"/></td><td><div class=\"btn-group\" role=\"group\" aria-label=\"...\"><button type=\"button\" class=\"btn btn-default\" onclick=\"addNewUser()\">添加</button><button type=\"button\" class=\"btn btn-default\" style=\"color:red;\" onclick=\"noadd()\">取消</button></div></td>	</tr>");
  	  				var json = JSON.parse(data);
  	  				for(var i = 0;i<json.length;i++){
  	  					str = "<tr>"+
  	  						  "<td>"+json[i].uid+"</td>"+
  	  						  "<td>"+json[i].username+"</td>"+
  	  						  "<td>"+json[i].password+"</td>"+
  	  						  "<td>"+json[i].address+"</td>"+
  	  						  "<td>"+json[i].tel+"</td>"+
  	  						  "<td>"+json[i].email+"</td>"+
  	  						  "<td><div class=\"btn-group\" role=\"group\" aria-label=\"...\"><button type=\"button\" class=\"btn btn-default\" onclick=\"editUser("+json[i].uid+")\">编辑</button><button type=\"button\" class=\"btn btn-default\" style=\"color:red;\" onclick=\"deleteUser("+json[i].uid+")\">删除</button></div></td>"+
  	  						  "</tr>"; 	  						  
  	  						  $('#tbody').append(str);
  	  				} 	  				
  				});  				
  			} 			
  		}); 		
  	});
  	
  	
  	//编辑
  	function editUser(uuid,uusername,upassword,uaddress,utel,uemail){
  		var str = "";
  		$("#"+uuid).html("");
  		$("#"+uuid).append("<td><input type=\"text\" class=\"form-control id\" id=\"uuid\" value=\""+uuid+"\"></td><td><input type=\"text\" class=\"form-control id\" id=\"uusername\" value=\""+uusername+"\"></td><td><input type=\"text\" class=\"form-control id\" id=\"upassword\" value=\""+upassword+"\"/></td><td><input type=\"text\" class=\"form-control\" id=\"uaddress\" value=\""+uaddress+"\"/></td><td><input type=\"text\" class=\"form-control id\" id=\"utel\" value=\""+utel+"\"/></td><td><input type=\"text\" class=\"form-control\" id=\"uemail\"  value=\""+uemail+"\"/></td><td><div class=\"btn-group\" role=\"group\" aria-label=\"...\"><button type=\"button\" class=\"btn btn-default\" onclick=\"editNewUser()\">编辑</button><button type=\"button\" class=\"btn btn-default\" style=\"color:red;\" onclick=\"noedit()\">取消</button></div></td>"); 		
  	}
  	function editNewUser(){
  		var uid = $('#uuid').val();
  		var username = $('#uusername').val();
  		var password = $('#upassword').val();
  		var address = $('#uaddress').val();
  		var tel = $('#utel').val();
  		var email = $('#uemail').val();
  		$.ajax({
  			url:'${pageContext.request.contextPath}/editServlet',
  			type:'post',
  			data:{
  				"uid":uid,
  				"username":username,
  				"password":password,
  				"address":address,
  				"tel":tel,
  				"email":email
  			},
  			error:function(data){
  				$('#deletemsg').attr("class","hide"); 	
  				alert('请求失败');
  			},
  			success:function(data){
  				$('#deletemsg').attr("class","hide"); 	
  				$.post("${pageContext.request.contextPath}/queryServlet",{"flag":"addfresh"},function(data){
  					var str = "";
  	  				$('#tbody').html("");
  	  	  			$('#tbody').append("<tr id=\"addtr\" class=\"hide\"><td><input type=\"text\" class=\"form-control id\" placeholder=\"请输入用户id\" id=\"uid\"/></td><td><input type=\"text\" class=\"form-control id\" placeholder=\"请输入用户名\" id=\"username\"/></td><td><input type=\"text\" class=\"form-control id\" placeholder=\"请输入密码\" id=\"password\"/></td><td><input type=\"text\" class=\"form-control\" placeholder=\"请输入地址\" id=\"address\"/></td><td><input type=\"text\" class=\"form-control id\" placeholder=\"请输入电话\" id=\"tel\"/></td><td><input type=\"text\" class=\"form-control\" placeholder=\"请输入邮箱\" id=\"email\"/></td><td><div class=\"btn-group\" role=\"group\" aria-label=\"...\"><button type=\"button\" class=\"btn btn-default\" onclick=\"addNewUser()\">添加</button><button type=\"button\" class=\"btn btn-default\" style=\"color:red;\" onclick=\"noadd()\">取消</button></div></td>	</tr>");
  	  				var json = JSON.parse(data);
  	  				for(var i = 0;i<json.length;i++){
  	  					str = "<tr>"+
  	  						  "<td>"+json[i].uid+"</td>"+
  	  						  "<td>"+json[i].username+"</td>"+
  	  						  "<td>"+json[i].password+"</td>"+
  	  						  "<td>"+json[i].address+"</td>"+
  	  						  "<td>"+json[i].tel+"</td>"+
  	  						  "<td>"+json[i].email+"</td>"+
  	  						  "<td><div class=\"btn-group\" role=\"group\" aria-label=\"...\"><button type=\"button\" class=\"btn btn-default\" onclick=\"editUser("+json[i].uid+")\">编辑</button><button type=\"button\" class=\"btn btn-default\" style=\"color:red;\" onclick=\"deleteUser(${i.uid})\">删除</button></div></td>"+
  	  						  "</tr>"; 	  						  
  	  						  $('#tbody').append(str);
  	  				} 	  				
  				});  				
  			} 			
  		});
  	}
  	function noedit(uid){
  		window.location.href="${pageContext.request.contextPath}/queryServlet";  			
  	}
  </script>
</body>

</html>