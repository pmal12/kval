=begin
  
rescue Exception => e
  
end
class StoreController < ApplicationController
  def index
  	@products = Product.order(:title)
  	@time = Time.now
  end
   def index
    @products = Product.order(:title)
    @counter = session[:counter]
    @counter.nil? ? @counter = 1 : @counter+=1
    session[:counter] = @counter
  end
end

=end

class StoreController < ApplicationController
  skip_before_action :authorize
  include CurrentCart
  before_action :set_cart
  def index
    @products = Product.order(:title)
    @cart = current_cart
    @advertisements = Advertisement.order(:title)
  end
end

