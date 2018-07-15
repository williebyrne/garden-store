class CartController < ApplicationController
  
  before_action :authenticate_user!
  
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
  
  
  def createOrder 
    # Step 1: Get the current user 
    #lecture 8
    @user = User.find(current_user.id) 
    
    # Step 2: Create a new order and associate it with the current user 
    #create order variable, add user id, date time, status info
    @order = @user.orders.build(:order_date => DateTime.now, :status => 'Pending') 
  
    #save the order in the db
    @order.save 
  
    # Step 3: For each item in the cart, create a new item on the order!! 
  
    #create a cart variable and set it equal to the contents of the cart
    @cart = session[:cart] || {} 
  
    # Get the content of the Cart 
  
    #loop through each line in the cart and get id, quantity & associated info from the db
    @cart.each do | id, quantity | item = Item.find_by_id(id) 
  
    #create order item variable, using order number, item id etc. Most details are retrieved from db, quantity is a variable from the cart
    @orderitem = @order.orderitems.build(:item_id => item.id, :title => item.title, :description => item.description, :quantity => quantity, :price=> item.price) 
  
    #save the orderitem in the db
    @orderitem.save 
  
    end  
    #need to tell create order page what @orders is made of. gives access to all orders in db.
    @orders = Order.all
    
    @orderitems = Orderitem.where(order_id: Order.last)
    
    #empty the cart once order is created
    session[:cart] = nil
    
  end
  
   
  
end
