class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(restuarant_params)
    redirect_to "/restaurants"
  end

  private

  def restuarant_params
    params.require(:restaurant).permit(:name)
  end

end
