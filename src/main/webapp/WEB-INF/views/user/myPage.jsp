<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에어캠프</title>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<h2>마이페이지</h2>
	
	
		<tr>
			<td>${u_nickname}님 환영합니다.</td>
		</tr>
		<tr>
			<td>프로필 사진</td>
			<td>
			<c:if test="${empty u_profile}">
                &nbsp;
          	</c:if>
           	<c:if test="${!empty u_profile}">
				<img src="<%=request.getContextPath() %>/upload/${u_profile}" height="100" width="100" />
			</c:if></td>
		</tr>
		<br>
	
	<div class="btns">
		
		<input type="button" value="정보수정" onclick="location='/user/update'" />
		<input type="button" value="회원탈퇴" onclick="location='/user/withdraw'" />
	</div>
</body>
</html>