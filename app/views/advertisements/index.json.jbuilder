json.array!(@advertisements) do |advertisement|
  json.extract! advertisement, :id, :title, :image_url
  json.url advertisement_url(advertisement, format: :json)
end
