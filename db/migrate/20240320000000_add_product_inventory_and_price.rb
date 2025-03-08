class AddProductInventoryAndPrice < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :inventory, :integer, null: false, default: 0
    add_column :products, :price, :decimal, precision: 10, scale: 2, null: false, default: 0.0
  end
end