json.array!(@orders) do |order|
  json.extract! order, :id, :price, :description, :date, :deadline, :client
  json.url order_url(order, format: :json)
end
