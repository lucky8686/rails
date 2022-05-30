module CurrentCart

    private
  
    def set_cart
      @cart = Cart.find(params[:cart_id])
    rescue ActiveRecord::RecordNotFound
      @cart = Cart.create
      params[:cart_id] = @cart.id
    end
  end