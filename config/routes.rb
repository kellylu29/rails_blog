Rails.application.routes.draw do
  get  '/',        to: 'users#index'
  get  '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  get  '/logout',  to: 'sessions#destroy'

  resources :users, :posts, :comments

end
