class PlacesController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

  def index
    @places = Place.all.order("id DESC").page(params[:page]).per(4)
  end

  def new
    @place = Place.new
  end

  def edit
    @place = Place.friendly.find(params[:id])

    if @place.user != current_user
      return render :text => 'Not Allowed', :status => :forbidden
    end
  end

  def show
    @place = Place.friendly.find_by(slug: params[:id])
    @comment = Comment.new
    @photo = Photo.new
  end

  def update
    @place = Place.friendly.find.(params[:id])
    if @place.user != current_user
      return render :text => 'Not Allowed', :status => :forbidden
    end
    @place.update_attributes(place_params)
    if @place.valid?
      redirect_to root_path
    else
      render :edit, :status => :unprocessable_entity
    end
  end

  def create
    @place = current_user.places.create(place_params)
    if @place.valid?
      redirect_to place_path(@place)
    else
      render :new, :status => :unprocessable_entity
    end
  end

  def destroy
    @place = Place.friendly.find.(params[:id])
    if @place.user != current_user
      return render :text => 'Not Allowed', :status => :forbidden
    end
    @place.destroy
    redirect_to root_path
  end

  def place_params
    params.require(:place).permit(:name, :description, :address)
  end
end
