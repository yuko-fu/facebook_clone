Rails.application.routes.draw do
  resources :pictures
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
end
