class BusinessesController < ApplicationController
  before_action :set_business, except: :create


  def create
    @business = Business.new business_params
    @business.user = current_user
    if @business.save
      render json: { message: 'Business successfully created.', data: @business }, status: :created
    else
      render json: { message: 'Business not created.', error: @business.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  def show
    render json: { data: @business }
  end

  def update
    if @business.update(business_params)
      render json: { message: 'Business successfully updated.', data: @business }, status: :ok
    else
      render json: { message: 'Business not updated.', error: @business.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  def destroy
    @business.destroy
    render json: { message: 'Business successfully deleted.', data: @business }, status: :ok
  end

  private

  def business_params
    params.require(:business).permit :name, :account_id, :location_id
  end

  def set_business
    @business = current_user.business
  end

end
