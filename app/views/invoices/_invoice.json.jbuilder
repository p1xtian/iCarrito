json.extract! invoice, :id, :date, :typedoc, :folio, :correlative, :uid, :name, :netsales, :taxes, :grosssales, :void, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
