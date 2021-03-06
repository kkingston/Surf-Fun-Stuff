class Api::SurfboardsController < ApplicationController
  before_action :set_surfboard, only: [:show, :update, :destroy]
  
  def index
    render json: Surfboard.all
  end

  def show
    render json: @surfboard
  end

  def create
    surfboard = Surfboard.new(surfboard_params)
    if surfboard.save
      render json: surfboard
    else
      render json: {message: surfboard.errors}, status: 400
    end
  end

  def update
    if @surfboard.update(surfboard_params)
      render json: @surfboard
    else
      render json: {message: surfboard.errors}, status: 400
    end
  end

  def destroy
    if @surfboard.destroy
      render status: 204
    else
      render json: {message: "Something went wrong.. try again.."}, status: 400
    end
  end

  private

  def set_surfboard
    @surfboard = Surfboard.find_by(id: params[:id])
  end

  def surfboard_params
    params.require(:surfboard).permit(:name, :price, :img_url, :size, :shaper, :location, :description)
  end
end