class OrdersController < ApplicationController
  
  def index
    @orders = Order.all
    @order = Order.new
  end
  
  def show

   # @orders = Order.all.paginate(page: params[:page], per_page: 5)
       @orders = Order.all
  end
  
  def new
  end
  
  def create
  end

end