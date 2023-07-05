Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users

  resources :groups do
    resources :operations
  end
  root "groups#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
