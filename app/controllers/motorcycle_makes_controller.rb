class MotorcycleMakesController < ApplicationController
  before_action :set_motorcycle_make, only: [:show, :update, :destroy]

  # GET /motorcycle_makes
  def index
    @motorcycle_makes = MotorcycleMake.all

    render json: @motorcycle_makes
  end

  # GET /motorcycle_makes/1
  def show
    render json: @motorcycle_make
  end

  # POST /motorcycle_makes
  def create
    @motorcycle_make = MotorcycleMake.new(motorcycle_make_params)

    if @motorcycle_make.save
      render json: @motorcycle_make, status: :created, location: @motorcycle_make
    else
      render json: @motorcycle_make.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /motorcycle_makes/1
  def update
    if @motorcycle_make.update(motorcycle_make_params)
      render json: @motorcycle_make
    else
      render json: @motorcycle_make.errors, status: :unprocessable_entity
    end
  end

  # DELETE /motorcycle_makes/1
  def destroy
    @motorcycle_make.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_motorcycle_make
      @motorcycle_make = MotorcycleMake.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def motorcycle_make_params
      params.require(:motorcycle_make).permit(:name)
    end
end
