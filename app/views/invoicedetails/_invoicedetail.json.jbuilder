json.extract! invoicedetail, :id, :invoice_id, :sku, :name, :quantity, :price, :total, :created_at, :updated_at
json.url invoicedetail_url(invoicedetail, format: :json)
