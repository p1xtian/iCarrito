json.extract! product, :id, :sku, :name, :price, :stock, :active, :created_at, :updated_at
json.url product_url(product, format: :json)
