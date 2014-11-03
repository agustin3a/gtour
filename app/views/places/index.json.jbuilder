json.array!(@places) do |place|
  json.extract! place, :id, :name, :type, :address, :phone, :website, :latitude, :longitude
  json.url place_url(place, format: :json)
end
