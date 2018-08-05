class OrdersController < ApplicationController
  
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  
  before_action :authenticate_user!
  before_action :is_admin?, only: [:index, :edit, :destroy, :new, :edit]
  
  def is_admin?
      # check if user has admin rights
      # if not admin then redirect to home page 
      redirect_to root_path unless current_user.admin? 
  end
  
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
    #Order.destroy_all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    
    @orderitems = Orderitem.where(order_id: params[:id])
  end
 
  def pay
  @order = Order.last # improve this
  @order.update_attribute(:status, "Paid by User:#{current_user.email}")
  @orderitems = Orderitem.all
  @items = Item.all
  end
  
  def shipped
     # @order = Order.where(order_id: params[:id])
      @order = Order.find(params[:id])
      @order.update_attribute(:status, "Dispatched")
  end

  
  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:order_date, :user_id, :status)
    end
    
  
    
end
