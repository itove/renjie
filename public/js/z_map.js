window._AMapSecurityConfig = {
            securityJsCode:'76636e9692509e65528251d7a3c487c6',
}

let coord = [110.71023,32.652396];

let map = new AMap.Map('amap-container', {
	resizeEnable: true,
	zoom:14,
	center: coord
});


function addMarker(coord) {
	let marker = new AMap.Marker({
		//position: new AMap.LngLat(coord[0], coord[1]),
	});
	marker.setPosition(coord);
	map.add(marker);
}

function showInfoWindow(coord) {
	let infoWindow = new AMap.InfoWindow({
		anchor: 'top-left',
		content: '湖北人杰特种汽车科技有限公司',
	});
	infoWindow.open(map, coord);
}

addMarker(coord);
showInfoWindow(coord);
