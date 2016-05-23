
const app = {}
  
window.onload = function() {
  
  app.elm = Elm.Main.fullscreen();

  console.log(`onload ELM APP`);
  console.dir(app.elm);

  app.elm.ports.create.subscribe(create)
  
};

const create = (karta) => {
  console.log(`CREATE MAP`);
  console.dir(karta);
  
  const {id, center, zoom} = karta
  
  console.log("create_map: ", id)
  
  app.map = L.map(id).setView(center, zoom);
        L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
            attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
            maxZoom: 18,
            id: 'mapbox.streets',
            accessToken: 'pk.eyJ1IjoiZG9tb2dsZWQiLCJhIjoiY2luN3piMWoxMDAyeXc5bHppNnN2dHVjbiJ9.FxeEPR3az9SV27KiLv3R1Q'
            // accessToken: 'pk.eyJ1IjoiZG9tb2dsZWQiLCJhIjoiY2luN3o3YmxyMDAzNndjbHpreThpdGRiMiJ9.KrcPrMys90cufj7wUtXQ0g'
        }).addTo(app.map);

		L.marker([48.815, 17.520]).addTo(app.map)
			.bindPopup("<b>Hello world!</b><br />I am a popup.").openPopup();

		L.circle([48.819, 17.515], 500, {
			color: 'red',
			fillColor: '#f03',
			fillOpacity: 0.5
		}).addTo(app.map).bindPopup("I am a circle.");

		L.polygon([
			[48.810, 17.519],
			[48.815, 17.524],
			[48.820, 17.510]
		]).addTo(app.map).bindPopup("I am a polygon.");


		

		app.map.on('click', onMapClick)
}

const onMapClick = (e) => {
  
  var popup = L.popup();

  const msg = "You clicked the map at " + e.latlng.toString()
  
  console.log(e);
  
  popup
    .setLatLng(e.latlng)
    .setContent(msg)
    .openOn(app.map);
    
    // const originaleEvent = e.originalEvent
    const mouseEventData = {
      latLng: [e.latlng.lat, e.latlng.lng],
      layerPoint: [e.layerPoint.x, e.layerPoint.y],
      containerPoint: [e.containerPoint.x, e.containerPoint.y]
    }
    
    app.elm.ports.onMouseEvent.send(mouseEventData)
  
}



