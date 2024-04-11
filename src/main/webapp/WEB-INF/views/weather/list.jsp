<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>에어캠프</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8c9e55110c1603351ffdbd52b18185d7"></script>
<!-- jQuery 라이브러리 추가 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>

<div id="map" style="width: 500px; height: 400px;"></div>

<script>
let mapContainer = document.getElementById('map'),
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567),
        level: 12
    };

let map = new kakao.maps.Map(mapContainer, mapOption),
    customOverlay = new kakao.maps.CustomOverlay({}),
    detailMode = false,
    polygons = [];

function removePolygon() {
    for (let i = 0; i < polygons.length; i++) {
        polygons[i].setMap(null);
    }
    polygons = [];
}

function init(path) {
    removePolygon(); // 기존 폴리곤 제거
    $.getJSON(path, function (geojson) {
        let areas = []; // 지역 데이터 초기화
        var units = geojson.features;
        $.each(units, function (index, unit) {
            let ob = { // ob 객체 정의
                name: unit.properties.SIG_KOR_NM,
                path: unit.geometry.coordinates[0].map(coordinate => new kakao.maps.LatLng(coordinate[1], coordinate[0])),
                location: unit.properties.SIG_CD
            };
            areas.push(ob);
        });

        // 지도에 폴리곤 표시 로직
        areas.forEach(area => {
            displayArea(area);
        });
    });
}
function displayArea(area) {
    var polygon = new kakao.maps.Polygon({
        map: map,
        path: area.path,
        strokeWeight: 2,
        strokeColor: '#004c80',
        strokeOpacity: 0.8,
        fillColor: '#fff',
        fillOpacity: 0.7
    });
    polygons.push(polygon);

    // mouseover 이벤트 리스너
    kakao.maps.event.addListener(polygon, 'mouseover', function(mouseEvent) {
        polygon.setOptions({fillColor: '#09f'});
        customOverlay.setContent('<div class="area">' + area.name + '</div>');
        customOverlay.setPosition(mouseEvent.latLng);
        customOverlay.setMap(map);
    });

    // mouseout 이벤트 리스너
    kakao.maps.event.addListener(polygon, 'mouseout', function() {
        polygon.setOptions({fillColor: '#fff'});
        customOverlay.setMap(null);
    });

    // 클릭 이벤트 리스너
    kakao.maps.event.addListener(polygon, 'click', function(mouseEvent) {
        console.log('Polygon clicked: ' + area.name);
        // 클릭한 지역에 대한 추가 작업을 여기에 구현합니다.
    });
}

// zoom_changed 이벤트 리스너 및 init 호출 로직...
kakao.maps.event.addListener(map, 'zoom_changed', function () {
    // 줌 레벨 변경 시 로직...
});

init("json/sido.json"); // 초기 시작
</script>
</body>
</html>
