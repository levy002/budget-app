Rails.application.routes.draw do
  
  devise_for :users
  
  resources :categories, only: [:index, :show, :new, :create, :destroy] do
    resources :transactions, only: [:new, :create, :destroy]
  end  

  root 'users#index'
end
