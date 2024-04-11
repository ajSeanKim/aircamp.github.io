<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에어캠프</title>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<main class="wrap">
		<section class="top">
			<h2 class="title">${tour.tour_name}</h2>
			<div class="info">
				<a href="/tour/read?tour_id=${tour.tour_id }"> 
				<img src="${fn:split(tour.tour_images,',')[0]}"  width="500" height="300"></a>
				<div>${tour.tour_desc}</div>
			</div>
			<div id="map" style="width:500px;height:400px;"></div>
		</section>
	</main>
	<%@ include file="../footer.jsp"%>
	<script>
		window.onload = function () {
		    kakao.maps.load(function () {
		    	var tour = {locx: ${tour.tour_locx},locy: ${tour.tour_locy}};
		    	console.log("위치:"+ tour.locx);
		    	console.log("위치:"+ tour.locy);
				var container = document.getElementById('map');
				var options = {
					center: new kakao.maps.LatLng("127.5112565", "37.7278127"), //중심좌표
					level: 3 //확대,축소레벨
				};
				
				var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		    })
		}
	</script>
</body>
</html>