class CampersController < ApplicationController
  def index
    @campers = Camper.all
  end

  def new 
    @camper = Camper.new
  end

  def create 
    @camper = Camper.create(camper_params)
    redirect_to camper_path(@camper)
  end

  def show 
    @camper = Camper.find(params[:id])
    # redirect_to camper_path(@camper)
  end

  def camper_params
    params.require(:camper).permit(:name, :age)
  end
end
