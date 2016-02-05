<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<title>RoxyNotice</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
.td-content { height: 60% }
</style>
</head>
<body>
	<div class="container">
		<c:import url="/WEB-INF/views/include/header.jsp"/>

		<div class="content">
			<div class="notice" class="notice-form">
				<table class="table table-bordered">
					<tr>
						<th colspan="2">글보기</th>
					</tr>
					<tr>
						<td class="text-center">제목</td>
						<td>${vo.title }</td>
					</tr>
					<tr>
						<td class="text-center td-content">내용</td>
						<td>
							<div class="view-content">
								${fn:replace(vo.content, newLineChar, '<br/>') }
							</div>
						</td>
					</tr>
					<tr>
						<td class="text-center">파일</td>
						<td>
							<!-- <img src="${pageContext.request.contextPath }/upload-files/${vo.fileName}" width=150px> -->
							<a href="${pageContext.request.contextPath }${vo.fileName}">${vo.fileOriginalName }</a>
						</td> 
					</tr>
				</table>
				<div class="btn-group">
					<a href="${pageContext.request.contextPath}/notice/" class="btn btn-default">글목록</a>
					<c:if test="${vo.member_no==authUser.no }">
						<a href="${pageContext.request.contextPath}/notice/modifyform?no=${vo.no }" class="btn btn-default">글수정</a>
					</c:if>
				</div>
			</div>
		</div>
		<c:import url="/WEB-INF/views/include/footer.jsp"/>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>