Rails.application.routes.draw do
  get  '/',        to: 'posts#index'
  get  '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  get  '/logout',  to: 'sessions#destroy'

  resources :users, :posts, :comments

end
