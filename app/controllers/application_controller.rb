class ApplicationController < ActionController::Base
	before_action :authorize
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :load_categories, :load_advertisments


  private
    def load_categories
      @categories = Category.order(:name)
    end

    def load_advertisments
      @advertisements = Advertisement.order(:title)
    end

    def current_cart 
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end



	protected

    def authorize
      unless User.find_by_id(session[:user_id])
        redirect_to login_url, alert: "Please log in"
      end
    end
end
