module InvoicesHelper

def get_products
Product.where("active = ? AND stock > ?",true,0).map {|b| [b.name,b.id]}
end

def get_clients
Client.all.map {|b| [b.name,b.id]}
end

def get_last_invoice(typedoc)
Invoice.where(typedoc:typedoc).last.map {|b| [b.folio + "-" + (b.correlative.to_i + 1).to_s,b.id]}
end


end
