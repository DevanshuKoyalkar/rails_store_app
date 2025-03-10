class ProductsController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]
  # show all products
  def index
    @products = Product.all
  end
  # show a single product
  def show
    @product = Product.find(params[:id])
  end
  # params for the product
  def product_params
    params.require(:product).permit(:name, :inventory, :price, :description, :featured_image, :brand_id)
  end
  # create a new product
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end
  # show the new product form
  def new
    @product = Product.new
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end
end
