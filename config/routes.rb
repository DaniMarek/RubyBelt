Rails.application.routes.draw do
  get 'groups/new'

  root "users#index"

  get 'join/:id' => 'groups#join'
  get 'leave/:id' => 'groups#leave'
  get 'delete/:id' => 'groups#delete'
  get 'login' => 'sessions#new', as: 'new_login'
  post 'login' => 'sessions#create', as: 'login'
  get 'logout' => 'sessions#destroy', as: 'logout'
  resources :users
  resources :groups
end
