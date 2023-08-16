class ReviewsController < ApplicationController
  before_action :set_restaurant, only: %i[new create]
  def new
    @review = Review.new
  end

  def create
    # permit the content
    # make a new instance of review
    @review = Review.new(review_params)
    # save

    # assign the restaurant to the review
    # @review.restaurant_id = params[:restaurant_id]
    @review.restaurant = @restaurant

    # if saved
    if @review.save
      # redirect to restaurant show page
      redirect_to restaurant_path(@restaurant)
    else
      # if not
      # render the form again
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant), status: :see_other
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
