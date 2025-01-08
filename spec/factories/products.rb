FactoryBot.define do
  factory :product do
    sku { "000001" }
    name { "hat" }
    description { "nice hat" }
    product_category
  end
end
