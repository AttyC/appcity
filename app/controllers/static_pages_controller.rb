class StaticPagesController < ApplicationController
  def index
  end
  
  def landing_page
    @products = Product.limit(3)
  end
  
  def featured_page
    @featured_product = Product.first
  end
  
  def gallery

  end
  
  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver
  end
end
