Rails.application.routes.draw do
  resources :roadtrips
  resources :users
  resources :check_ins
  root to: "welcome#index"

  get '/welcome/test' => 'welcome#test'

  resources :sessions, only: [:new, :create, :destroy]
  
  get '/login', to: 'sessions#new'

 	get '/logout', to: 'sessions#destroy'

 	get "/auth/:provider/callback", to: "sessions#create", as: "signin"
end
