class CreateInventoryItems < ActiveRecord::Migration[7.1]
  def change
    create_table :inventory_items do |t|
      t.references :clinic, null: false, foreign_key: true
      t.string :medicine_name
      t.integer :quantity
      t.decimal :price

      t.timestamps
    end
  end
end
