require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'is valid with sku and name' do
    product = create(:product)
    expect(product).to be_valid
  end


  context 'Validations' do
    subject { create(:product, sku: '000001') }
    it { is_expected.to validate_presence_of(:sku) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:sku).case_insensitive }
  end

end