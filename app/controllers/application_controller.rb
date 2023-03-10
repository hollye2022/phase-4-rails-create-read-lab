class ApplicationController < ActionController::API
  include ActionController::Cookies
wrap_parameters format:[]
  def index
    plants=Plant.all 
    render json: plants, status: :ok
  end

  def show
    plant = Plant.find_by(id:params[:id])
    if plant
      render json: plant, status: :ok
    else
      render json: {error:"plant not found"}, status: :not_found
    end
  end

  def create
    plant = Plant.create(params)
    render json: plant, status: :created
  end

  private

  def params
    params.permit(:name, :image, :price)
  end

end
