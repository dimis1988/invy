class CreateProductCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :product_categories do |t|
      t.string :sku, :null => false
      t.string :name, :null => false
      t.text :description

      t.timestamps
    end
    add_index :product_categories, :sku,  unique: true
    add_index :product_categories, :name,  unique: true
  end
end
