<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<title>RoxyBoard</title>
<style type="text/css">
#profile { float: left; }
#notice { float: right; width:700px; height:390px; padding: 50px;}
h3 { color: red; }
</style>
</head>
<body>
	<div class="container">
		<c:import url="/WEB-INF/views/include/header.jsp"/>
		<div class="wrapper">
			<div class="content">
				<div id="site-introduction">
					<img id="profile"  class="img-thumbnail img-responsive" src="http://img.etnews.com/news/article/2016/01/06/cms_temp_article_06110123642009.jpg" alt="Responsive image">
					<div id="notice">
					<h3>공지사항</h3>
						<table class="table table-hover">					
							<c:forEach var="vo" items="${data.list }" varStatus="status">
							<c:if test="${status.index<5 }">
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
								</tr>
							</c:if>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
		<c:import url="/WEB-INF/views/include/footer.jsp"/>
	</div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>