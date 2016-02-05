<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
#search_form { float:left; }
#write { float:right; }
</style>
</head>
<body>
<c:if test="${param.result=='fail' }">
	<script>
		alert('관리자가 아닙니다.');
	</script>
</c:if>
	<div class="container">
		<c:import url="/WEB-INF/views/include/header.jsp"/>
		<h1>공지사항</h1>
		<div class="content">
			<div id="notice">
				<table class="table table-hover">
					<tr>
						<th>번호</th>
						<th id="title" >제목</th>
						<th>글쓴이</th>
						<th>작성일</th>
						<th>조회수</th>
						<th>&nbsp;</th>
					</tr>				
					
					<c:forEach var="vo" items="${data.list }" varStatus="status">
					<tr>
						<td>${data.startIndex - status.index }</td>
						<td class="title-td"><a href="${pageContext.request.contextPath}/notice/view?no=${vo.no }">&nbsp;
							<c:if test="${vo.depth>0 }">
								<c:forEach begin="1" end="${vo.depth }">
									&nbsp;&nbsp;
								</c:forEach>
								<img src="${pageContext.request.contextPath}/assets/images/ico-reply.gif">
							</c:if>
							${vo.title }
						</a></td>
						<td>${vo.member_name }</td>
						<td>${vo.reg_date }</td>
						<td>${vo.view_cnt }</td>
						<td>
							<c:if test="${vo.member_no==authUser.no }">
								<a href="${pageContext.request.contextPath}/notice/delete?no=${vo.no }" class="glyphicon glyphicon-remove"></a>
							</c:if>
						</td>
					</tr>
					</c:forEach>
				</table>
				
				<nav>
					<ul class="pagination">
						<c:if test="${data.prevPage!=data.pg }">
						<li><a aria-label="Previous" href="${pageContext.request.contextPath}/notice/?pg=${data.prevPage }&kwd=${data.kwd }&searchType=${data.searchType }"><span aria-hidden="true">&laquo;</span></a></li>
						</c:if>
						<c:forEach begin="0" end="${data.blockSize-1}" varStatus="status">
							<c:if test="${data.startPageNo+status.index <= data.totalPageSize }">
								<li class="no${data.startPageNo+status.index }" ><a href="${pageContext.request.contextPath}/notice/?pg=${data.startPageNo+status.index }&kwd=${data.kwd }&searchType=${data.searchType }">${data.startPageNo+status.index }</a></li>
							</c:if>						
						</c:forEach>
						<c:if test="${data.nextPage!=data.pg }">
						<li><a aria-label="Next" href="${pageContext.request.contextPath}/notice/?pg=${data.nextPage }&kwd=${data.kwd }&searchType=${data.searchType }"><span aria-hidden="true">&raquo;</span></a></li>
						</c:if>
					</ul>	
				</nav>
				
				<div class="bottom">
					<form id="search_form" class="form-inline" action="${pageContext.request.contextPath}/notice/" method="get">
						<div class="form-group">
							<select id="searchType" class="form-control" name="searchType">
								<option value="title">제목+내용</option>
							</select>
							<input type="text" id="kwd" name="kwd"  class="form-control" value="">
							<button type="submit" class="btn btn-default">Search</button>
						</div>
					</form>
					
					<c:if test="${ authUser.email =='admin' }">
						<a id="write" class="btn btn-default" href="${pageContext.request.contextPath}/notice/writeform"  role="button">글쓰기</a>
					</c:if>
					
				</div>				
			</div>
		</div>
		<c:import url="/WEB-INF/views/include/footer.jsp"/>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
<script>
$(function(){
	$(".no${data.pg}").addClass("active");
});
</script>
</body>
</html>