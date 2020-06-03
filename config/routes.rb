Rails.application.routes.draw do
  root to: 'users#index'

  resources :users
  resources :relationships, only: [:create, :destroy]

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'rooms/show'
end
