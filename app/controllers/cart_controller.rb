class CartController < ApplicationController
  
  def add
        # get the id of the product
        id = params[:id]
        
        # if the cart exists use it, or if not make a new cart.
        
        if session[:cart] then
          cart = session[:cart]
        else
          session[:cart] = {}
          cart = session[:cart]
        end  
        
        # check if ite is there and if so increment the quantity by 1
        # if the item is not there then set the quantity to be 1
        
        if cart[id] then
          cart[id] = cart[id] + 1
        else
          cart[id] = 1
        end 
    
    redirect_to :action => :index
  end
  
  def clear
    session[:cart] = nil
    redirect_to :action => :index
  end
    
  
  def remove
    id = params[:id]
    cart = session[:cart]
    cart.delete id
    redirect_to :action => :index
  end
  
  def clear
    session[:cart] = nil
    redirect_to :action => :index
  end
  
  
  def index
    # pass the cart to be displayed
    if session[:cart] then
      @cart = session[:cart]
    else
      @cart = {}
    end
  end
end
