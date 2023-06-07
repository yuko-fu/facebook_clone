Rails.application.routes.draw do
  get 'session/new'
  resources :pictures
  resources :users, only: [:new, :create, :show]
  resources :session, only: [:new, :create, :destroy]
end
