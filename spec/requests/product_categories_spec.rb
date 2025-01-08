require 'rails_helper'

RSpec.describe "ProductCategories", type: :request do
  describe "GET /index" do
    it "returns successful response" do
      get product_categories_path
      expect(response).to be_successful
    end
  end

end
