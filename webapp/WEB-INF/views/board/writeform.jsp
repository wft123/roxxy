<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
		alert('제목을 입력하세요.');
	</script>
</c:if>
</head>
<body>
	<div class="container">
		<c:import url="/WEB-INF/views/include/header.jsp"/>
		<div class="content">
			<div id="board">
				<form class="form-horizontal"  method="post" action="${pageContext.request.contextPath}/board/write"  enctype="multipart/form-data">
				<fieldset class="fieldset">
				<legend>글쓰기</legend>
		 			<input type="hidden" name="member_no" value="${authUser.no }">
					<input type = "hidden" name = "group_no" value="${vo.group_no }">
					<input type = "hidden" name = "order_no" value="${vo.order_no }">
					<input type = "hidden" name = "depth" value="${vo.depth }">
					
					<div class="form-group">
					<label class="col-sm-2 control-label" for="name">제목</label>
					<input type="text" name="title" value="">
					</div>
					<div class="form-group">
					<label class="col-sm-2 control-label" for="name">내용</label>
					<textarea id="content" name="content"></textarea>
					</div>
					<div class="form-group">
					<label class="col-sm-2 control-label" for="name">파일</label>
					<input type="file" name="file"  >
					</div>
					
					<div class="form-group">
					    <div class="btn-group col-sm-offset-2 col-sm-10">
							<a href="${pageContext.request.contextPath}/board/" class="btn btn-danger">취소</a>
					    	<button type="submit" class="btn btn-default">등록</button>
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