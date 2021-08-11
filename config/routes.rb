Rails.application.routes.draw do
  resources :microposts
  root 'application#hello'
  resources :users
end
