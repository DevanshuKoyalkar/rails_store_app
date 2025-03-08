class ProductsController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]
  def index
    @products = Product.all
  end
  def show
    @product = Product.find(params[:id])
  end
  def create
    @product = Product.new(params.require(:product).permit(:name, :inventory, :price))
    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end 
  def new
    @product = Product.new
  end
end
