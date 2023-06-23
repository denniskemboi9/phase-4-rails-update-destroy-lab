class PlantsController < ApplicationController
  wrap_parameters format: []
  # GET /plants
  def index
    plants = Plant.all
    render json: plants
  end

  # GET /plants/:id
  def show
    plant = Plant.find_by(id: params[:id])
    render json: plant
  end

  # POST /plants
  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

  # Uodate
  def update
    updated_plant = Plant.find_by(id: params[:id])
    updated_plant.update(plant_params)
    render json: updated_plant, status: :accepted
  end

  # Destroy
  def destroy
    deleted_plant = Plant.find_by(id: params[:id])
    deleted_plant.destroy
    head :no_content
  end

  private

  def plant_params
    params.permit(:name, :image, :price, :is_in_stock)
  end
end
