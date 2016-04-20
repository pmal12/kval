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
  before_action :set_prod, only: :index


  # GET /
  def index
    @cart = current_cart
    if params[:search]
      @products = @products.search(params[:search]).order("created_at DESC")
    else
      @products = @products.order('created_at DESC')
    end
  end

  # GET /category/:id
  def show
    @category = Category.find_by_id(params[:category_id])
    @products = @category.products
  end

  def set_prod
    @products = Product.order(:title)
  end

end
