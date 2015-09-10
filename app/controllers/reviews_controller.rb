class ReviewsController < ApplicationController
  # before_filter :load_product
  before_action :ensure_logged_in, only: [:create, :destroy]
  before_action :load_product

  def show
    # @review = Review.find(params[:id])
  end

  def create
    # Q: What is the difference between .build & .new?
    # A: build should be applied to a collection, while a should be applied to a class
    # Review.new(product_id: @product.id)  # This line is funtionally equivalent as line 12
    @review = @product.reviews.build(review_params)
    @review.user = current_user
    if @review.save
      redirect_to products_path, notice: 'Review created successfully'
    else
      render 'products/show' # render a View, not render an action
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

  private
  def review_params
    params.require(:review).permit(:comment, :product_id)
  end

  def load_product
    @product = Product.find(params[:product_id])
  end
end
