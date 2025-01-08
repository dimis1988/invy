Rails.application.routes.draw do
  resources :products
  resources :product_categories
  root 'home#index'

  get "up" => "rails/health#show", as: :rails_health_check

end
