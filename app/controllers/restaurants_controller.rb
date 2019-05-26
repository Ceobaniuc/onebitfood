class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: :show

  def index
    @restaurants = Restaurant.near(params[:city] || 'Porto Velho')
    filter_by_category if params[:category]
    render json: @restaurants
  end

  def show
    render json: @restaurant, product_categories: true
  end

  def search
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find_by(id: params[:id])
  end

  def filter_by_category
    @restaurants = @restaurants.select do |r|
      r.category.title == params[:category]
  end
end
