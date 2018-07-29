class StaticPagesController < ApplicationController
  
  def home
    @categories = Category.all
    
  end
  
  
  def category
    categoryName = params[:title]
    @items = Item.where("Category like ?", categoryName)  
  end
  
 
  def adminUpdate
    newAdmin = params[:q]
    @user = User.where(email: newAdmin)
   # @user_admin = "True"
   # @user.save
    
   @user.update(admin: "True")
    
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
  end

  def about
  end
end
