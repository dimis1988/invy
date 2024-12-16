require 'rails_helper'

RSpec.describe "Home", type: :request do
  it 'responds successfully as root path' do 
    get root_path
    expect(response).to be_successful
  end

  it 'responds with 200' do 
    get root_path
    expect(response).to have_http_status(200)
  end
end
