Rails.application.routes.draw do
  resources :users do 
    resources :areas
  end
end
