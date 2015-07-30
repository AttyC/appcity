class StaticPagesController < ApplicationController
  def index
  end
  
  def landing_page
    @products = Product.limit(3)
  end
  
  def featured_page
    @featured_product = Product.first
  end
end
