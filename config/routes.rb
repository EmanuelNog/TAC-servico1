Rails.application.routes.draw do
  post "/login", to: "sessions#login"
  post "/signup", to: "users#create"

  resources :users do 
    resources :areas
  end
end
