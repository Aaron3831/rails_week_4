Rails.application.routes.draw do
  root 'animals#index'
  resources :animals
  get '/random', to:'animals#random'
  get '/search', to:'animals#search'
end
