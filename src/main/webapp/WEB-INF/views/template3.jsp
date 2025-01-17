<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<tiles:insertAttribute name="head"/>
</head>
<body>
	<div class="container">
		<tiles:insertAttribute name="content3" />
		
		<c:if test="${ not empty errorMsg }">
            <div class="alert alert-error">${ errorMsg }</div>
        </c:if>
        <c:if test="${ not empty successMsg }">
            <div class="alert alert-success">${ successMsg }</div>
        </c:if>
	</div>
</body>
</html>