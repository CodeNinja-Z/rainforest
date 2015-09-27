class ReviewsController < ApplicationController
  # before_filter :load_product
  before_action :ensure_logged_in, only: [:create, :destroy]
  before_action :load_product

  def show
    # @review = Review.find(params[:id])
  end

  def create
    # Q: What is the difference between .build & .new?
    # A: build should be applied to a collection, while new should be applied to a class
    # Review.new(product_id: @product.id)  # This line is funtionally equivalent as next line
    @review = @product.reviews.build(review_params)
    @review.user = current_user
    respond_to do |format|
      if @review.save
        # redirect_to products_path, notice: 'Review created successfully'
        # Q: Using redirect_to when an ajax call happens is pointless, since XHR blocks
        # redirection anyways. One won't see current page being redirected.
        # So what's the point of writing the line below?
        format.html { redirect_to product_path(@product.id), notice:'Review added!' }
        format.js {}
      else
        # render 'products/show' # render a View, not render an action
        # Q: Why render show path without passing in an id parameter?
        format.html { render 'products/show', alert: 'There was an error!' }
      end
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
