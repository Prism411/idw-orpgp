Rails.application.routes.draw do
  get 'dashboard/index'
  get 'home/index'
  devise_for :users
  root to: 'home#index'
  get 'dashboard', to: 'dashboard#index', as: :dashboard
  get 'player_dashboard/:id', to: 'campaigns#player_dashboard', as: 'player_dashboard'

  resources :campaigns do
    member do
      get 'dashboard'
      get 'master', to: 'campaigns#master', as: :master_campaign
      get 'characters', to: 'campaigns#characters', as: :campaign_characters
    end
    resources :characters, only: [:new, :create, :index]
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
