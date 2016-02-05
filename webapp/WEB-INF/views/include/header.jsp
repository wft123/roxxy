<%@ page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-default">
<div class="container-fluid">
	<a class="navbar-brand" href="${pageContext.request.contextPath}/">RoxyBoard</a>
	<ul class="nav navbar-nav navbar-right">
		<c:choose>
			<c:when test="${empty authUser }">
				<li><a href="${pageContext.request.contextPath}/guestbook/">방명록</a></li>
				<li><a href="${pageContext.request.contextPath}/user/joinform">회원가입</a></li>
				<li><a href="${pageContext.request.contextPath}/user/loginform">로그인</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="${pageContext.request.contextPath}/notice/">공지사항</a></li>
				<li><a href="${pageContext.request.contextPath}/board/">게시판</a></li>
				<li><a href="${pageContext.request.contextPath}/guestbook/">방명록</a></li>
				<li><a href="${pageContext.request.contextPath}/user/logout">로그아웃</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>
</nav>