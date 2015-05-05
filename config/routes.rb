Rails.application.routes.draw do
  resources :roadtrips
  resources :users
  resources :check_ins
  root to: "welcome#index"

  resources :sessions, only: [:new, :create, :destroy]
  
  get '/login', to: 'sessions#new'

 	get '/logout', to: 'sessions#destroy'
 
 	get '/my_itineraries', to: 'wishlists#my_itineraries'

 	get '/auth/facebook/callback', to: 'sessions#create'
end
