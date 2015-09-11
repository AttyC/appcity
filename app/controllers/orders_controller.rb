class OrdersController < ApplicationController
  
  def index
  end
  
  def show

   @orders = Order.all.paginate(page: params[:page], per_page: 5)

  end
  
  def new
  end
  
  def create
  end

end