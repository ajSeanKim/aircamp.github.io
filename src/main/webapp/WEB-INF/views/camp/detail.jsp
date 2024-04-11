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
		<section class="top">
			<h2 class="title">${camp.camp_name}</h2>
			<div class="info">
				<img src="${camp.camp_image}">
				<div>${camp.camp_desc}</div>
			</div>
			<div id="map" style="width:500px;height:400px;"></div>
		</section>
	</main>
	<%@ include file="../footer.jsp"%>
	<!-- <script>
		window.onload = function () {
		    kakao.maps.load(function () {
		    	var camp = {locx: ${camp.camp_locx},locy: ${camp.camp_locy}};
		    	console.log("위치:"+ camp.locx);
		    	console.log("위치:"+ camp.locy);
				var container = document.getElementById('map');
				var options = {
					center: new kakao.maps.LatLng("127.5112565", "37.7278127"), //중심좌표
					level: 3 //확대,축소레벨
				};
				
				var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		    })
		}
	</script>
	
	

<div id="map" style="width:500px;height:400px; text-align:center;"></div> -->



<h1>지도 출력</h1>

<div id="map2" style="width:500px;height:400px; text-align:center;"></div>


<script>
var mapContainer = document.getElementById('map2'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(${camp.camp_locy}, ${camp.camp_locx}), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 


var coords = new kakao.maps.LatLng(${camp.camp_locy}, ${camp.camp_locx});

// 결과값으로 받은 위치를 마커로 표시합니다
var marker = new kakao.maps.Marker({
    map: map,
    position: coords
});

// 인포윈도우로 장소에 대한 설명을 표시합니다
var infowindow = new kakao.maps.InfoWindow({
    content: '<div style="width:150px;text-align:center;padding:6px 0;">${camp.camp_name}</div>'
});
infowindow.open(map, marker);

// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
map.setCenter(coords);

</script>
	
	
</body>
</html>