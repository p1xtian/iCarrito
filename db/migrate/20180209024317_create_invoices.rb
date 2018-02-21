class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.date :date
      t.integer :typedoc
      t.string :folio
      t.string :correlative
      t.string :uid
      t.string :name
      t.float :netsales
      t.float :taxes
      t.float :grosssales
      t.boolean :void

      t.timestamps
    end
  end
end
