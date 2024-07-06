Rails.application.routes.draw do
  get 'dashboard/index'
  get 'home/index'
  devise_for :users
  root to: 'home#index'
  get 'dashboard', to: 'dashboard#index', as: :dashboard

  resources :campaigns

  get "up" => "rails/health#show", as: :rails_health_check
end
