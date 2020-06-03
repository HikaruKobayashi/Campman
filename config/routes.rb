Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :relationships, only: [:create, :destroy]

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'matching' => 'users#index'
  get 'users' => 'users#new'
  post 'users'=> 'users#create'
  delete 'users' => 'users#destroy'
end
