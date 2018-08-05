class StaticPagesController < ApplicationController
  
  before_action :authenticate_user!, only: [:admin, :adminUpdate, :adminDowngrade]
  before_action :is_admin?, only: [:admin, :adminUpdate, :adminDowngrade]
  
  def is_admin?
      # check if user has admin rights
      # if not admin then redirect to home page 
      redirect_to root_path unless current_user.admin? 
  end
  
  def home
    @categories = Category.all
    @orderitems = Orderitem.all
    @cart = session[:cart]
    @items = Item.all
  end
  
  
  def category
    categoryName = params[:title]
    @items = Item.where("Category like ?", categoryName)  
  end
  
  def admin
    @users = User.all
  end
 
  def adminUpdate
     @user = User.find(params[:id])
     @user.update_attribute(:admin, true)
  end
  
  def adminDowngrade
     @user = User.find(params[:id])
     @user.update_attribute(:admin, false)
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
  
  def help
    @categories = Category.all
    
    #@user = User.find(current_user.id)
    #@user.update_attribute(:admin, true)
  end

  def about
    @categories = Category.all
  end
  
  def paypalReturn
  end
  
end
