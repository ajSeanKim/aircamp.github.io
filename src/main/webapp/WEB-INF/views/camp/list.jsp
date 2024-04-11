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
	
	<section class="search-container wrap">
		
		<form id="search-form" action="/camp/list">
			<input type="hidden" name="page" value="1">
			<div class="box local">
				<p class="title">지역</p>
				<select id="citySelect" name="addr1" title="도/특별시" onchange="populateDistricts()">
					  <option value="">전체/도</option>
					  <option value="서울시">서울시</option><option value="부산시">부산시</option>
					  <option value="대구시">대구시</option><option value="인천시">인천시</option>
					  <option value="광주시">광주시</option><option value="대전시">대전시</option>
					  <option value="울산시">울산시</option><option value="세종시">세종시</option>
					  <option value="경기도">경기도</option><option value="강원도">강원도</option>
					  <option value="충청북도">충청북도</option><option value="충청남도">충청남도</option>
					  <option value="전라북도">전라북도</option><option value="전라남도">전라남도</option>
					  <option value="경상북도">경상북도</option><option value="경상남도">경상남도</option>
					  <option value="제주도">제주도</option>
				</select>
				<select id="districtSelect" name="addr2" title="도/특별시를 선택하세요">
				  <option value="">전체/시/군/구</option>
				</select>
			</div>
			<div class="box keyword">
				<p class="title">검색어</p>
				<input id="keyword" name="keyword" title="검색어를 입력하세요." placeholder="검색어를 입력하세요." type="text">
			</div>
			<button type="submit" class="btn-submit">검색</button>
		</form>
	</section>
	
	
	
	<form class="list-container wrap">
		<p class="count">총 ${campCount}개의 캠핑장이 검색되었습니다</p>
		<div class="list-wrap">
			<c:forEach var="list" items="${campList}">
				<div class="list">
					<a href="/camp/detail?camp_no=${list.camp_no}" class="inner"> 
						<c:choose>
						    <c:when test="${empty list.camp_image}">
						        <img src="images/noimage.jpg">
						    </c:when>
						    <c:otherwise>
						        <img src="${list.camp_image}">
						    </c:otherwise>
						</c:choose>
						<div class="text-box">
							<span class="title">[${list.camp_do_name} ${list.camp_city_name}] ${list.camp_name}</span>
							<span class="desc">${list.camp_intro}</span>
						</div>
					</a>
				</div>
			</c:forEach>
		</div>
		<div class="pagination-wrap">
			<c:choose>
			    <c:when test="${campCount > 0}">
			        <!-- 첫페이지, 이전블록 으로 이동 -->
			        <c:if test="${startPage > 1}">
			            <a href="/camp/list?page=1&addr1=${search.addr1}&addr2=${search.addr2}&keyword=${search.keyword}"> << </a>
			        </c:if>
			        <c:if test="${startPage > 10}">
			            <a href="/camp/list?page=${startPage - 10}&addr1=${search.addr1}&addr2=${search.addr2}&keyword=${search.keyword}"> < </a>
			        </c:if>
			
			        <c:forEach var="i" begin="${startPage}" end="${endPage}">
	                    <a href="/camp/list?page=${i}&addr1=${search.addr1}&addr2=${search.addr2}&keyword=${search.keyword}">${i}</a>
			        </c:forEach>
			
			        <!-- 다음블록, 마지막페이지 로 이동 -->
			        <c:if test="${endPage < maxPage}">
			            <a href="/camp/list?page=${startPage + 10}&addr1=${search.addr1}&addr2=${search.addr2}&keyword=${search.keyword}"> > </a>
			        </c:if>
			        <c:if test="${endPage < maxPage}">
			            <a href="/camp/list?page=${maxPage}&addr1=${search.addr1}&addr2=${search.addr2}&keyword=${search.keyword}"> >> </a>
			        </c:if>
		    	</c:when>
		     	<c:otherwise>
			        검색된 캠핑장이 없습니다.
			    </c:otherwise>
		    </c:choose>
		</div>
	</form>
	<%@ include file="../footer.jsp"%>
</body>
</html>