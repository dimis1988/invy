class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :sku, :null => false
      t.string :name, :null => false
      t.text :description

      t.timestamps
    end
    add_index :products, :sku, unique: true
    add_index :products, :name, unique: true
  end
end
