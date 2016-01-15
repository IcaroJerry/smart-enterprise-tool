json.array!(@costs) do |cost|
  json.extract! cost, :id, :value, :installments, :date, :description, :isfixed, :isespecial, :user_id
  json.url cost_url(cost, format: :json)
end
