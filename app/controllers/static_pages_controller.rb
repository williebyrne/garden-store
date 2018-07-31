class StaticPagesController < ApplicationController
  
  def home
    @categories = Category.all
    @orderitems = Orderitem.all
    @cart = session[:cart]
    
    
  end
  
  
  def category
    categoryName = params[:title]
    @items = Item.where("Category like ?", categoryName)  
  end
  
 
  def adminUpdate
    
    
  end
  
  
  
  def myOrders
    @orders = Order.where(user_id: current_user.id)
    
  end
  
  def popularProducts
    @orderitems = Orderitem.all
  end
  
  def displayCart
    if session[:cart] then
        @cart = session[:cart]
    else
        @cart = {}
    end
  end
  
  def admin
  end
  

  def help
    @categories = Category.all
  end

  def about
    @categories = Category.all
  end
end
