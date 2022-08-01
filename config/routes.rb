# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users

  resources :categories, only: %i[index show new create destroy] do
    resources :transactions, only: %i[new create destroy]
  end

  unauthenticated :user do
    root 'users#index'
  end

  authenticated :user do
    root 'users#show', as: :authenticated_root
  end

end
