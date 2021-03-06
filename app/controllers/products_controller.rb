class ProductsController < ApplicationController

	def new
		@product = Product.new 
	end

	def create
		@product = Product.new 
		@product.update(product_params)
		redirect_to products_path
	end

	def index
		@products = Product.all 
	end

	def inventory
		product = Product.find(params[:id])
		render plain: product.inventory > 0 ? true : false
	end

	def description 
		product = Product.find(params[:id])
		render plain: product.description
	end

	private 

	def product_params
		params.require(:product).permit(:name, :description, :price, :inventory)
	end

end
