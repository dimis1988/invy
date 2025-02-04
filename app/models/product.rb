class Product < ApplicationRecord
    belongs_to :product_category
    validates :name, presence: true
    validates :sku, presence: true, uniqueness: true
end
