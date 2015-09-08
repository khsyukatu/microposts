Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'signup', to: 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
    
  get 'users/followings' => "users#followings"
  
  resources :users
  resources :microposts
  resources :sessions, only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
end
