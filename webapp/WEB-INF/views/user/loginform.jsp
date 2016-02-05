<%@ page contentType="text/html;charset=UTF-8" %>
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
</head>
<body>
	<div class="container">
		<c:import url="/WEB-INF/views/include/header.jsp"/>
		<div class="content">
			<div id="user">
				<form id="login-form" class="form-horizontal" name="loginform" method="post" action="${pageContext.request.contextPath}/user/login">
				<fieldset class="fieldset">
				<legend>LOGIN</legend>
					<div class="form-group">
					<label class="col-sm-2 control-label" for="email">아이디</label>
					<input id="email" name="email" type="text" value="">
					</div>
					<div class="form-group">
					<label class="col-sm-2 control-label">패스워드</label>
					<input name="password" type="password" value="">
					</div>
					<c:if test="${param.result=='fail'}">
						<div class="form-group">
						<label class="col-sm-2 control-label">로그인이 실패 했습니다.</label>
						</div>
					</c:if>
					<div class="form-group">
					    <div class="col-sm-offset-2 col-sm-10">
					      <button type="submit" class="btn btn-default">LOGIN</button>
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
</body>
</html>