class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def show
    @attraction = Attraction.find_by_id(params[:id])
    @ride = Ride.new
  end

  def create
    attraction = Attraction.new(attraction_params)

    attraction.save if current_user.admin == true

    redirect_to attraction_path(attraction)
  end

  def edit
    @attraction = Attraction.find_by_id(params[:id])
  end

  def update
    @attraction = Attraction.find_by_id(params[:id])
    @attraction.update(attraction_params)

    redirect_to attraction_path(@attraction)
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
  end

end