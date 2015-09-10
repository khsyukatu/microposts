Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'signup', to: 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  resources :users, only: [:show] do
    get 'followings' => "users#followings"
    get 'followers' => "users#followers"
    get 'fav_tweets' => "users#fav_tweets"
  end
  
  resources :users
  resources :microposts
  post "microposts/retweet"
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :fav_relationships, only: [:create, :destroy]
end
