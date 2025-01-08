class ProductCategory < ApplicationRecord
    has_many :products, dependent: :destroy
    validates :name, presence: true
    validates :sku, presence: true, uniqueness: true
end
