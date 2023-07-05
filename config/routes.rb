Rails.application.routes.draw do
  devise_for :users

  root 'home#categories'

  resources :categories do
    resources :operations, only: [:index, :new, :create]
  end
end