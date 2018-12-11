Rails.application.routes.draw do  
  resources :users
  post 'user_auth', to: 'auth#user_auth'
  get 'quotes/:tag', to: 'quotes#show_by_tag'  
end
