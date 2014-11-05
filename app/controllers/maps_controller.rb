class MapsController < ApplicationController
  def map
  	@places = Place.all
		@geojson = Array.new
		@places.each do |place|
			comments = Comments.where(place_id: place.id)
			if place.type == 1 
				color = '#E74C3C'
				symbol = 'park'
			elsif place.type == 2
				color = '#1abc9c'
				symbol = 'place-of-worship'
			elsif place.type == 3
				color = '#27ae60'
				symbol = 'museum'
			elsif place.type == 4
				color = '#e67e22'
				symbol = 'building'
			elsif place.type == 5
				color = '#3498db'
				symbol = 'restaurant'
			elsif place.type == 6
				color = '#f1c40f'
				symbol = 'shop'
			end
		ptype = place.type.to_s
		  @geojson << {
		    type: 'Feature',
		    geometry: {
		      type: 'Point',
		      coordinates: [place.longitude, place.latitude]
		    },
		    properties: {
		      name: place.name,
		      address: place.address,
		      phone: place.phone,
		      website: place.website,
		      type: ptype,
		      id: place.id,
		      comments: [
			      comments.each do |comment|
			      	{
			      	title: comment.body,
			      	body: comment.title
			      	}
			      end
		 	 ],
	      	:'marker-color' => color,
	      	:'marker-symbol' => symbol,
	      	:'marker-size' => 'medium'		      
		    }
		  }
		end
		respond_to do |format|
  	format.html
  	format.json { render json: @geojson }  # respond with the created JSON object
end
  end
end
