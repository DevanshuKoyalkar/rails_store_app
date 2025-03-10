class AddBrandToProducts < ActiveRecord::Migration[7.0]
  def up
    # First create the default brand
    default_brand = Brand.create!(
      name: 'Generic',
      description: 'Default brand for products'
    )

    # Add the brand_id column, allowing null temporarily
    add_reference :products, :brand, null: true, foreign_key: true
    
    # Update all existing products to use the default brand
    execute <<-SQL
      UPDATE products 
      SET brand_id = #{default_brand.id}
      WHERE brand_id IS NULL
    SQL
    
    # Now make the column non-null
    change_column_null :products, :brand_id, false
  end

  def down
    remove_reference :products, :brand
  end
end 