class PlacesController < ApplicationController
  def index
    @places = Place.all.page(params[:page]).per(4)
  end

  def new
    @place = Place.new
  end

  def place_paramms
  end
end
