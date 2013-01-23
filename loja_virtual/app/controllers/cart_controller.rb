require 'cart_manager'
class CartController < ApplicationController
  include CartManager
  helper_method :cart
  
  def show
    @items    = cart.items
    @products = @items.collect(&:product)
    
    # GET /cart/show.html
    # GET /cart/show.json    
    respond_to do |format|
      format.html { render layout: false  } 
      format.json { render json:   @items }
    end
  end
  
  def finish
  	respond_to do |format|
  		format.html
  	end
  end
end
