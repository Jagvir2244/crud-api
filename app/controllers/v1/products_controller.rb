class V1::ProductsController < ApplicationController
	protect_from_forgery with: :null_session

	def index
		products = Product.all
		render json: { products: products }
	end

	def show
		product = Product.find(params[:id]) rescue nil 
		if product.present?
		  render json: { product: product}
		else
			render json: { error: "Product not found"  }
		end
	end


	def new
		product = Product.new
		render json: { product: product}
	end

	def create
		product = Product.create(product_params)
			if product.present?
		  render json: { product: product}
		else
			render json: { error: "Product not create"  }
		end
	end
	

	

	def update
		product = Product.find(params[:id])
	end

	def destroy
		product = Product.find(params[:id]) 
        
    if product.present?
       	product.destroy
		  render json: { product: "product deleted" }
		else
			render json: { error: "product not delete" }
		end
	end
	 private
  def product_params
    params.require(:product).permit(:name, :color, :brand)
  end

end
 
