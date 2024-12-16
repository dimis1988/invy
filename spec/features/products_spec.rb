require 'rails_helper'

RSpec.feature "Products", type: :feature do
  it 'visit index page' do 
    visit(products_path)
    expect(page).to have_current_path(products_path)
  end

  it 'creates product' do 
    visit(new_product_path)
    fill_in('Sku', with: '000001')
    fill_in('Name', with: 'product')
    fill_in('Description', with: 'product_one')
    click_button('Create Product')
    expect(page).to have_content("Product was successfully created.")
  end

  describe 'updates/delete existing product' do
    before(:each) do
      @product = Product.create!(sku: "123456", name: "Old Product", description: "Old description")
    end
    it 'updates product' do 
      visit(edit_product_path(@product))
      fill_in('Sku', with: '000001')
      fill_in('Name', with: 'product')
      fill_in('Description', with: 'product_one')
      click_button('Create Product')
      expect(page).to have_content("Product was successfully updated.")
    end
    it 'deletes product' do 
      visit(products_path)
      click_button('Delete')
      expect(page).not_to have_content(@product.name)
    end
  end

end
