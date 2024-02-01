Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:new, :create, :show]
  resources :blogs
  
  delete '/logout', to: 'users#logout'
  
  root to: 'users#login'
end
