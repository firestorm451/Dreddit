json.array!(@links) do |link|
  json.extract! link, :id, :title, :url, :summary, :user_id
  json.url link_url(link, format: :json)
end
