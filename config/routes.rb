Rails.application.routes.draw do
  
  resources :categories
  resources :orders do resources:orderitmes
  end
  
  devise_for :users do resources:orders
  end
  
  get 'cart/index'
  resources :items
  root 'static_pages#home'
  
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  
  get '/myOrders', to: 'static_pages#myOrders'
  
  get '/paid', to: 'orders#pay'
  
  get '/shipped/:id', to: 'orders#shipped'
  
  get '/category/:title', to: 'static_pages#category'
  
  get '/cart', to: 'cart#index'
  get '/checkout', to: 'cart#createOrder'
  
  get '/popularProducts', to: 'static_pages#popularProducts'
  
  get '/admin', to: 'static_pages#admin'
  
  get '/adminUpdate/:id', to: 'static_pages#adminUpdate'
  get '/adminDowngrade/:id', to: 'static_pages#adminDowngrade'
  
  get '/paypalReturn', to: 'static_pages#paypalReturn'
  
  post '/search', to: 'items#search'

  get '/cart/clear', to: 'cart#clear'
  get '/cart/:id', to: 'cart#add'
  get '/cart/remove/:id', to: 'cart#remove'
  
end
