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

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restuarant_params)
    redirect_to "/restaurants"
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    flash[:notice] = "Restaurant has been successfully deleted"
    redirect_to "/restaurants"
  end

  private

  def restuarant_params
    params.require(:restaurant).permit(:name, :description)
  end

end
