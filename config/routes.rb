Rails.application.routes.draw do
  
  
  resources :orders do resources:orderitmes
  end
  
  
  devise_for :users do resources:orders
  end
  
  get 'cart/index'
  resources :items
  root 'static_pages#home'
  
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  
  get '/paid', to: 'orders#pay'
  
  get '/shipped/:id', to: 'orders#shipped'
  
  get '/cart', to: 'cart#index'
  get '/checkout', to: 'cart#createOrder'
  
  post '/search', to: 'items#search'
  
  get '/cart/clear', to: 'cart#clear'
  get '/cart/:id', to: 'cart#add'
  get '/cart/remove/:id', to: 'cart#remove'
  
  
end
