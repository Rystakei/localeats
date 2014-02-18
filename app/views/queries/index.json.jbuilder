json.array!(@queries) do |query|
  json.extract! query, :id, :input, :result
  json.url query_url(query, format: :json)
end
