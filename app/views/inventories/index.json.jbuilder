json.array!(@inventories) do |inventory|
  json.extract! inventory, :id, :product_id, :quantity
  json.url inventory_url(inventory, format: :json)
end
