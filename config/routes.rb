Rails.application.routes.draw do
  devise_for :users
  root "groups#index"

  resources :users
  
  resources :groups do
    resources :operations
  end

  resources :operations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
