class CartsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
  before_action :set_cart, only: [:edit, :update, :destroy]

  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
    # @cart = Cart.find(params[:id]).line_items
    render json: @carts
    


  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    @cart = Cart.find(params[:id]).line_items
    render json: @cart
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
    render json: @cart
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)

    if @cart.save
      render :show, status: :created, location: @cart
    else
      render json: @cart.errors, status: :unprocessable_entity
    
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    if @cart.update(cart_params)
      render :show, status: :ok, location: @cart
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy 
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.fetch(:cart, {})
    end

    def invalid_cart
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to root_path, notice: "That cart doesn't exist"
    end
end
