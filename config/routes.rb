Rails.application.routes.draw do
  get 'dashboard/index'
  get 'home/index'
  devise_for :users
  root to: 'home#index'
  get 'dashboard', to: 'campaigns#index', as: :dashboard

  resources :campaigns do
    member do
      get 'dashboard'
      get 'master', to: 'campaigns#master', as: :master_campaign
      get 'characters', to: 'campaigns#characters', as: :campaign_characters
      get 'player_dashboard', to: 'campaigns#player_dashboard', as: :player_dashboard
    end
    resources :characters, only: [:new, :create, :index, :edit, :update]
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
