class PlacesController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]
  def index
    @places = Place.all.page(params[:page]).per(4)
  end

  def new
    @place = Place.new
  end

  def edit
    @place = Place.find(params[:id])
  end

  def show
    @place = Place.find(params[:id])
  end

  def create
    current_user.places.create(place_params)
    redirect_to root_path
  end

  def place_params
    params.require(:place).permit(:name, :description, :address)
  end
end
