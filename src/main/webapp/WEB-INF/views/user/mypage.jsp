<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<h3>현재 사용자</h3>

<sec:authorize access="authenticated">
	<table class="table table-bordered" style="width: 500px;">
      <tr>
         <td>이름</td>
         <td><sec:authentication property="user.u_name" /></td>
      </tr>

      <tr>
         <td>이메일</td>
         <td><sec:authentication property="user.u_email" /></td>
      </tr>
      <tr>
         <td>전화번호</td>
         <td><sec:authentication property="user.u_tel" /></td>
      </tr>
      <tr>
         <td>학년</td>
         <td><sec:authentication property="user.u_grade" /></td>
      </tr>
      <tr>
         <td>학과</td>
         <td><sec:authentication property="user.d_id" /></td>
      </tr>
      
	</table>
	<a href="/drive/user/myinfo_edit.pd" class="btn btn-primary">개인정보 수정</a>
	<a href="/drive/user/myinfo_pw.pd" class="btn btn-primary">비밀번호 변경</a>
</sec:authorize>
