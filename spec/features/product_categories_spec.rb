require 'rails_helper'

RSpec.feature "Product Categories", type: :feature do
  it 'visit index page' do 
    visit(product_categories_path)
    expect(page).to have_current_path(product_categories_path)
  end

  it 'creates category' do 
    visit(new_product_category_path)
    fill_in('Sku', with: '000001')
    fill_in('Name', with: 'product')
    fill_in('Description', with: 'product_one')
    click_button('Create Category')
    expect(page).to have_content("Category was successfully created.")
  end

  describe 'updates/delete existing Category' do
    before(:each) do
      @product_category = ProductCategory.create!(sku: "123456", name: "Old Category", description: "Old description")
    end
    it 'updates Category' do 
      visit(edit_product_category_path(@product_category))
      fill_in('Sku', with: '000001')
      fill_in('Name', with: 'product')
      fill_in('Description', with: 'product_one')
      click_button('Create Category')
      expect(page).to have_content("Category was successfully updated.")
    end
    it 'deletes Category' do 
      visit(product_categories_path)
      click_button('Delete')
      expect(page).not_to have_content(@product_category.name)
    end
  end
end
