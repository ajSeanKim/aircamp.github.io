<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에어캠프</title>
<style>
	.list-wrap {display:flex; flex-wrap:wrap; gap:2rem;}
	.list-wrap .list {position:relative; width: calc(25% - 15px); overflow:hidden; border-radius: 4px; box-shadow: 1px 5px 10px rgba(0,0,0,.1);}
	.list-wrap .list .inner {display:block;}
	.list-wrap .list .inner img {width:100%; height:21rem; object-fit:cover;}
	.list-wrap .list .inner .text-box {min-height:12rem; padding: 1.5rem 1rem;}
	.list-wrap .list .inner .text-box .title {display:block; text-overflow:ellipsis; white-space:nowrap; overflow:hidden; font-weight:700;}
	.list-wrap .list .inner .text-box .desc {margin-top:5px; height: 4rem; text-overflow:ellipsis; display:-webkit-box; font-size: 1.5rem; color:#777; line-height: 2rem; overflow: hidden; -webkit-line-clamp: 2;}
	.pagination-wrap {text-align:center;}
</style>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<form class="list-container wrap">
		<p class="count">총 ${tourCount}개의 관광지가 검색되었습니다</p>
		<div class="list-wrap">
			<c:forEach var="list" items="${tourList}">
				<div class="list">
					<a href="/tour/detail?tour_id=${list.tour_id}" class="inner"> 
						<c:choose>
						    <c:when test="${empty list.tour_images}">
						        <img src="images/logo01.png">
						    </c:when>
						    <c:otherwise>
						        <img src="${list.tour_images.split(',')[0]}">
						    </c:otherwise>
						</c:choose>
						<div class="text-box">			
							<span class="title">${list.tour_name}</span>
							<span class="desc">${list.tour_desc}</span>
						</div>
					</a>
				</div>
			</c:forEach>
		</div>
		<div class="pagination-wrap">
			<c:choose>
			    <c:when test="${tourCount > 0}">
			        <!-- 첫페이지, 이전블록 으로 이동 -->
			        <c:if test="${startPage > 1}">
			            <a href="/tour/list?page=1&addr1=${search.addr1}&addr2=${search.addr2}&keyword=${search.keyword}"> << </a>
			        </c:if>
			        <c:if test="${startPage > 10}">
			            <a href="/tour/list?page=${startPage - 10}&addr1=${search.addr1}&addr2=${search.addr2}&keyword=${search.keyword}"> < </a>
			        </c:if>
			
			        <c:forEach var="i" begin="${startPage}" end="${endPage}">
	                    <a href="/tour/list?page=${i}&addr1=${search.addr1}&addr2=${search.addr2}&keyword=${search.keyword}">${i}</a>
			        </c:forEach>
			
			        <!-- 다음블록, 마지막페이지 로 이동 -->
			        <c:if test="${endPage < maxPage}">
			            <a href="/tour/list?page=${startPage + 10}&addr1=${search.addr1}&addr2=${search.addr2}&keyword=${search.keyword}"> > </a>
			        </c:if>
			        <c:if test="${endPage < maxPage}">
			            <a href="/tour/list?page=${maxPage}&addr1=${search.addr1}&addr2=${search.addr2}&keyword=${search.keyword}"> >> </a>
			        </c:if>
		    	</c:when>
		     	<c:otherwise>
			        검색된 관광지가 없습니다.
			    </c:otherwise>
		    </c:choose>
		</div>
	</form>
	<%@ include file="../footer.jsp"%>
</body>
</html>