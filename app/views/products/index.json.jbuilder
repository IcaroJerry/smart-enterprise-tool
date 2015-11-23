json.array!(@products) do |product|
  json.extract! product, :id, :cod, :title, :description, :price, :picture
  json.url product_url(product, format: :json)
end
