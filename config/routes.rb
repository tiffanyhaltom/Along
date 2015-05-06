Rails.application.routes.draw do
  resources :roadtrips
  resources :users
  resources :check_ins
  root to: "welcome#index"
  
  resources :sessions, only: [:new, :create, :destroy]
  
  get '/login', to: 'sessions#new'

 	get 'signout', to: 'sessions#destroy', as: "signout"

 	get "/auth/:provider/callback", to: "sessions#create", as: "signin"
end
