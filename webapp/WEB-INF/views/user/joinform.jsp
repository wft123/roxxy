<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<title>RoxyBoard</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<c:if test="${param.result=='fail' }">
	<script>
		alert('모든 정보를 입력하세요.');
	</script>
</c:if>
<c:if test="${param.result=='noCheck' }">
	<script>
		alert('아이디 중복 검사를 해야합니다.');
	</script>
</c:if>
</head>
<body>
	<div class="container">
		<c:import url="/WEB-INF/views/include/header.jsp"/>
		<div class="content">
			<div class="user">

				<form id="join-form" class="form-horizontal"  name="joinForm" method="post" action="${pageContext.request.contextPath}/user/join">
				<fieldset class="fieldset">
				<legend>회원가입</legend>
					<div class="form-group">
					<label class="col-sm-2 control-label" for="name">이름</label>
					<input id="name" name="name" type="text" value="">
					</div>
					
					<div class="form-group">
					<label class="col-sm-2 control-label" for="email">아이디</label>
					<input id="email" name="email" type="text" value="">
					<img id="image-checked" src="${pageContext.request.contextPath}/assets/images/checked.png" style="width:12px; display:none;">
					<button id="btn-check"  type="button" class="btn btn-default">중복체크</button>
					<input type="hidden" id="isChecked" name="isChecked" value="">
					</div>
					
					<div class="form-group">
					<label class="col-sm-2 control-label">패스워드</label>
					<input name="password" type="password" value="">
					</div>
					
					 <div class="form-group">
						 <label class="col-sm-2 control-label">성별</label>
				        <label>여</label> <input type="radio" name="gender" value="female" checked="checked">
						<label>남</label> <input type="radio" name="gender" value="male">
				    </div>
								
					<div class="form-group">
					    <div class="col-sm-offset-2 col-sm-10">
					      <button type="submit" class="btn btn-default">Sign in</button>
					    </div>
					</div>
				</fieldset>
				</form>
			</div>
		</div>
		<c:import url="/WEB-INF/views/include/footer.jsp"/>
	</div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
    <script>
		$(function(){
			$("#email").change(function(){
				$("#btn-check").show();
				$("#image-checked").hide();
			});
			
			
			$( "#btn-check" ).click( function(){
				var email = $("#email").val();
				if(email=="") return;
				
				$.ajax({
					url: "${pageContext.request.contextPath}/user/checkEmail",
					type: "get",
					dataType:"json",
					data: "email="+email,
					//contentType: "application/json",
					success:function( response ){
						if(response.result =="fail"){
							console.error(response.message);
							return;
						}
						
						if(response.data ==false){
							alert("이미 사용중인 아이디입니다.");
							$("#email").val("");
							$("#email").focus();
							return;
						}
						$("#isChecked").val("ok");
						$("#btn-check").hide();
						$("#image-checked").show();
					},
					error: function(jqXHR, status, error ){
						console.error( status + ":" + error);
					}
				});
			});
		});
		</script>
</body>
</html>