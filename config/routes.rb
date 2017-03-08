Rails.application.routes.draw do
  resources :users
  post '/create', to: "sessions#create"
  get '/homepage', to: "users#homepage"
end
