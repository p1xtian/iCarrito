class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :uid
      t.string :name
      t.string :address
      t.string :telephone
      t.boolean :active

      t.timestamps
    end
  end
end
