<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에어캠프</title>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<main class="wrap">
		<div id="board-form">
			<h2>글 상세</h2>
			<table class="board-table">
				<tr>
					<th>제목</th>
					<td>${notice.no_subject}</td>
				</tr>
				<tr>
					<th>날짜</th>
					<td>${notice.no_date}</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>${notice.no_readcount}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${notice.no_content}</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>관리자</td>
				</tr>
			</table>
			<div class="btns">
				<input type="button" value="목록" onclick="location='/notice/list?page=${search.page}&keyword=${search.keyword}'">
				<c:if test="${sessionScope.u_id == 'admin'}">
					<input type="button" value="수정" onclick="location='/notice/update?no_no=${notice.no_no}&page=${search.page}&keyword=${search.keyword}'" />
					<input type="button" value="삭제" onclick="location='/notice/delete?no_no=${notice.no_no}&page=${search.page}&keyword=${search.keyword}'" />
				</c:if>
			</div>
		</div>
	</main>
	<%@ include file="../footer.jsp"%>
</body>
</html>