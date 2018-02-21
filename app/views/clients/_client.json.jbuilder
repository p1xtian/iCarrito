json.extract! client, :id, :uid, :name, :address, :telephone, :active, :created_at, :updated_at
json.url client_url(client, format: :json)
