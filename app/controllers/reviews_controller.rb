class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :update, :destroy]
  before_action :load_business, only: [:index, :create]

  def index
    render json: {message: "Showing all reviews for business id: #{@business.id}", data: @business.reviews }
  end

  def create
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :reply_content)
  end

  def set_review
    @review = params[:id]
  end

  def load_business
    @business = current_user.business
  end


end
