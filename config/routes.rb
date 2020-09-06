Rails.application.routes.draw do
  root 'home#top'
  get 'home/about'
  root 'users#show'
  devise_for :users
  resources :users,only: [:show, :create, :index,:edit,:update]
  resources :books,only: [:create, :index, :edit, :update, :show, :destroy]

end