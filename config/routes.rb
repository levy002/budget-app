Rails.application.routes.draw do
  devise_for :users
  
  resources :categories, only: [:index, :new, :create, :destroy]
  root 'users#index'
end
