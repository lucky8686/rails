class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  before_action :set_cart, only: [:create]

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
    render json: @line_items 
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
    render json: @line_item
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
  
    book = Book.find(params[:book_id])
    @line_item = @cart.add_book(book)
    
    
    if @line_item.save
      render json: @line_item
    else
      render json: @line_item.errors, status: :unprocessable_entity
    end
 
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    if @line_item.update(line_item_params)
      render json: @line_item
  else
    render json: @line_item.errors, status: :unprocessable_entity
  end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    
    # @cart = Cart.find(session[:cart_id])
    @line_item.destroy
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:book_id)
    end
end
