L.mapbox.accessToken = 'pk.eyJ1IjoiYWd1c3RpbjNhIiwiYSI6Ik5EU3FnSW8ifQ.c97mqtOcNcKft2TwV-tnEQ';
var map = L.mapbox.map('map', 'agustin3a.88bf40a9')
    .setView([14.56, -90.733], 15);

    var layers = {
      Streets: L.mapbox.tileLayer('examples.map-i87786ca'),
      Outdoors: L.mapbox.tileLayer('examples.ik7djhcc'),
      Satellite: L.mapbox.tileLayer('examples.map-igb471ik')
  };

layers.Streets.addTo(map);
L.control.layers(layers).addTo(map);
var markers;

  $.ajax({
  dataType: 'text',
  url: 'map.json',
  success: function(data) {
    var geojson;
    geojson = $.parseJSON(data);
    markers =  map.featureLayer.setGeoJSON(geojson);
    return markers;
  }
});

  map.featureLayer.on('layeradd', function(e) {
  var marker, popupContent, properties;
  marker = e.layer;
  properties = marker.feature.properties;
  popupContent = '<div class="popup"><a class="linkmodal" data-name="' + properties.name + '" data-toggle="modal" data-target="#myModal" data-address="'+ properties.address +'" data-phone="'+ properties.phone + '" data-web="'+ properties.website +'" data-id="' + properties.id + '" data-site="' + properties.site + '"> ' + '<h3>' + properties.name + '</h3>' + '<p>' + properties.address + '</p>' + '</a>' + '</div>';
  return marker.bindPopup(popupContent, {
    closeButton: false,
    minWidth: 320
  });
});



$('#map').on('click', '.linkmodal', function() {
    var title = $(this).data('name');
    var address = $(this).data('address');
    var phone = $(this).data('phone');
    var website = $(this).data('web');
    var site = $(this).data('site');
    web = "http://" + website;
    $('.modal-title').html(title);
    $('.modal-address').html(address);
    $('.modal-phone').html(phone);
    
    
    if(!(website == "")) {
    $('.modal-web').html('<a href="' + web + '"><span class="glyphicon glyphicon-link"></span>' + website + '</a>');
  } else {
    $('.modal-web').html(website);
  }

  if(!(site == "")) {
      $('.modal-site').html('<a href="' + site + '"><span class="glyphicon glyphicon-book"></span> More info</a>');
    } else {
      $('.modal-site').html(site);
    }

  var id = $(this).data('id');
   $(document).ready(function(){
        $("#email_field").val(id);
   });
    return true;
  
});



var list = [];

$('.sidemenu a').on('click', function() {
    var filter = $(this).data('filter');
    console.log(filter);
    if ($(this).hasClass('active')) {
      $(this).removeClass('active');
      var index = list.indexOf('filter');
      list.splice(index, 1);
    } else {
      $(this).addClass('active');
      list.push(filter);
    }
    markers.setFilter(function(f) {
        var index;
        for (index = 0; index < list.length; index++) {
          if (f.properties['type'] == list[index]) {
            return true;
          }
        }
      return false;
    });
    return false;
});