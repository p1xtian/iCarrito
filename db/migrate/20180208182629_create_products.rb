class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :sku
      t.string :name
      t.float :price
      t.integer :stock
      t.boolean :active

      t.timestamps
    end
  end
end
