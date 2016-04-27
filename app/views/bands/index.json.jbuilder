json.array!(@bands) do |band|
  json.extract! band, :id, :name, :musical_genre, :site
  json.url band_url(band, format: :json)
end
