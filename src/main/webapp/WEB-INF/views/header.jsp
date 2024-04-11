<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에어캠프</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
<link href="https://cdn.jsdelivr.net/gh/sun-typeface/SUIT/fonts/static/woff2/SUIT.css" rel="stylesheet">
<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/style.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c14db14988057dc0387ab78d000e6d1d&libraries=services"></script>
<script src="js/common.js"></script>
<link rel="icon" type="image/x-icon" href="${contextpath }/images/favicon01.ico">
</head>
<body>
<header id="ac-hd">
	<div class="wrap">
		<h1 class="logo">
			<a href="/main" title="메인으로 바로가기"> 
				<img src="images/logo01.png" alt="에어캠프 로고"> 
				<span class="sound-only">에어캠프</span>
			</a>
		</h1>
		<nav class="gnb-wrap">
			<h2 class="sound-only">주 메뉴</h2>
			<ol class="gnb">
				<li class="depth1">
					<a href="/camp/list">캠핑장</a>
					<ul class="depth2">
						<li><a href="/camp/list?page=1">캠핑장 검색</a></li>
					</ul>
				</li>
				<li class="depth1">
					<a href="/tour/list">관광지</a>
					<ul class="depth2">
						<li><a href="/tour/list">관광지 검색</a></li>
					</ul>
				</li>
				<!-- 추가할것. -->
				<li class="depth1">
					<a href="/weather/list">날씨보기</a>
					<ul class="depth2">
						<li><a href="">날씨보기</a></li>
					</ul>
				</li>
				<li class="depth1">
					<a href="/notice/list">공지사항</a>
					<ul class="depth2">
						<li><a href="/notice/list">공지사항</a></li>
					</ul>
				</li>
			</ol>
		</nav>
		<div class="util-menu">
			<c:choose>
				<c:when test="${not empty sessionScope.u_id}">
					<a href="/user/logout">로그아웃</a>
					<a href="/user/myPage">마이페이지</a>
				</c:when>
				<c:otherwise>
					<a href="/user/login">로그인</a>
					<a href="/user/join">회원가입</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div class="gnb-bg"></div>
</header>
</body>
</html>