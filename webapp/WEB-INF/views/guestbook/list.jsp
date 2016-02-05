<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<!doctype html>
<html>
<head>
<title>RoxyBoard</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
#guestbook { width: 80%; margin: 0 auto;}
textarea[name=message] { width:90%; resize:none; }
</style>
</head>
<body>
	<div class="container">
		<c:import url="/WEB-INF/views/include/header.jsp"/>
		<div class="content">
			<div id="guestbook">
				<h2>방명록</h2>
				<form action="${pageContext.request.contextPath}/guestbook/add" method="post">
					<table class="table">
						<tr>
							<td align=center>이름</td><td align=center><input type="text" name="name" ></td>
							<td align=center>비밀번호</td><td align=center><input type="password" name="password"></td>
						</tr>
						<tr>
							<td colspan=4 align=center><textarea name="message" id="message" cols=60 rows=5 ></textarea></td>
						</tr>
						<tr>
							<td colspan=4 align=right><button type="submit" class="btn btn-default">확인</button></td>
						</tr>
					</table>
				</form>
				<br/><br/>
				<hr>
				<ul>
					<c:forEach var="vo"  items="${list }"  varStatus="status">
					<li>
						<table class="table table-bordered">
							<tr>
								<td>[ ${list.size()-status.index } ]</td>
								<td>${vo.name }</td>
								<td>${vo.reg_date }</td>
								<td><a class="del" href="${pageContext.request.contextPath}/guestbook/deleteform?no=${vo.no }">삭제</a></td>
							</tr>
							<tr>
								<td colspan=4>
									${fn:replace(vo.message, newLineChar, '<br/>') }					
								</td>
							</tr>
						</table>
						<br>
					</li>
					</c:forEach>
				</ul>
				
			</div>
		</div>
		<c:import url="/WEB-INF/views/include/footer.jsp"/>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>