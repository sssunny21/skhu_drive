<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="/drive/home/index.pd">SKHU_Drive</a>
		</div>
		<div class="callapse navbar-collapse">
			<ul class="nav navbar-nav">
				<sec:authorize access="authenticated">
					<li><a href="/drive/pdrive/folderList.pd?dr_id=${drive.drive_id}">내 드라이브</a>
				</sec:authorize>
				<li><sec:authorize access="not authenticated">
						<a href="/drive/home/join_main.pd">회원가입</a>
					</sec:authorize></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<sec:authorize access="not authenticated">
					<li><a href="/drive/home/login.pd">로그인</a></li>
				</sec:authorize>
				<sec:authorize access="authenticated">
					<li><a> <c:forEach var="auth" items="${auth}"> ${auth }
            	</c:forEach>
					</a></li>
					<li><a href="/drive/user/mypage.pd">마이페이지 </a></li>
					<li><a href="/drive/home/logout.pd">로그아웃</a></li>
				</sec:authorize>
			</ul>
		</div>
	</div>
</nav>