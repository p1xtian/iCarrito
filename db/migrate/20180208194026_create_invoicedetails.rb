class CreateInvoicedetails < ActiveRecord::Migration[5.1]
  def change
    create_table :invoicedetails do |t|
      t.references :invoice, foreign_key: true
      t.string :sku
      t.string :name
      t.float :quantity
      t.float :price
      t.float :total

      t.timestamps
    end
  end
end
