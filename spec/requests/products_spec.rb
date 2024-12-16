require 'rails_helper'

RSpec.describe "Products", type: :request do
  
  let!(:product) { create(:product) }

  let(:valid_attributes) do
    { sku: "123456", name: "Test Product" } 
  end

  let(:invalid_attributes) do
    { sku: "123456", name: "" } 
  end

  describe "GET /index" do
    it "returns successful response" do
      get products_path
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "returns successful response" do
      get product_path(product)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "returns successful response" do
      get new_product_path
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "returns successful response" do
      get edit_product_path(product)
      expect(response).to be_successful
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      it 'redirects to the post' do
        patch product_path(product), params: { product: valid_attributes }
        product.reload
        expect(response).to redirect_to(product_path(product))
      end
    end
    context 'with invalid parameters' do
    end
  end

  describe "POST /create" do
    context 'with valid attributes' do 
      it "creates successful product" do
        expect do 
          post products_path, params: {product: valid_attributes}
        end.to change(Product, :count).by(1)
      end
      it "redirects to created product" do
        post products_path, params: { product: valid_attributes}
        expect(response).to redirect_to(product_path(Product.last))
      end
    end
    
    context 'with invalid attributes' do 
      it "does not creates product" do
        expect do 
          post products_path, params: {product: invalid_attributes}
        end.not_to change(Product, :count)
      end
      context 'with invalid parameters' do
        it "renders the new template" do
          post products_path, params: { product: invalid_attributes }
          expect(response).to render_template(:new)
        end
      end
    end

    describe 'DELETE /destroy' do
      it 'destroys the requested product' do
        expect do
          delete product_path(product)
        end.to change(Product, :count).by(-1)
      end
  
      it 'redirects to the posts list' do
        delete product_path(product)
        expect(response).to redirect_to(products_path)
      end
    end

  end

end


