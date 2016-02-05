<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<title>RoxyBoard</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<c:if test="${param.result=='fail' }">
	<script>
		alert('모든 정보를 입력하세요.');
	</script>
</c:if>
</head>
<body>
	<div class="container">
		<c:import url="/WEB-INF/views/include/header.jsp"/>
		<div class="content">
			<div class="guestbook" class="delete-form">
				<form class="form-horizontal"  method="post" action="${pageContext.request.contextPath}/guestbook/delete">
					<input type='hidden' name="no" value="${param.no }">
					
					<div class="form-group">
					<label class="col-sm-2 control-label" for="password">비밀번호</label>
					<input type="password" name="password">
					</div>
					
					<div class="form-group">
					    <div class="btn-group col-sm-offset-2 col-sm-10">
							<a href="${pageContext.request.contextPath}/guestbook/">방명록 리스트</a>
					    	<button type="submit" class="btn btn-default">삭제</button>
					    </div>
					</div>
					
				</form>
			</div>
		</div>
		<c:import url="/WEB-INF/views/include/footer.jsp"/>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>