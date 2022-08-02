# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions' }
  resources :users, only: %i[index]

  resources :categories, only: %i[index show new create destroy] do
    resources :transactions, only: %i[new create destroy]
  end

  resources :splash, only: %i[index]
  root 'splash#index'
end
