Rails.application.routes.draw do
  get 'comments/new'
  get 'users/index'
  get 'users/show'
  root 'blogs#index'

  devise_for :users
  get '/users/:id', to: 'users#show'

resources :blogs do
  resources :comments
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
