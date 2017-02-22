class MotorcycleModelsController < ApplicationController
  before_action :set_motorcycle_model, only: [:show, :update, :destroy]

  # GET /motorcycle_models
  def index
    @motorcycle_models = MotorcycleModel.all

    render json: @motorcycle_models
  end

  # GET /motorcycle_models/1
  def show
    render json: @motorcycle_model
  end

  # POST /motorcycle_models
  def create
    @motorcycle_model = MotorcycleModel.new(motorcycle_model_params)

    if @motorcycle_model.save
      render json: @motorcycle_model, status: :created, location: @motorcycle_model
    else
      render json: @motorcycle_model.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /motorcycle_models/1
  def update
    if @motorcycle_model.update(motorcycle_model_params)
      render json: @motorcycle_model
    else
      render json: @motorcycle_model.errors, status: :unprocessable_entity
    end
  end

  # DELETE /motorcycle_models/1
  def destroy
    @motorcycle_model.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_motorcycle_model
      @motorcycle_model = MotorcycleModel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def motorcycle_model_params
      params.require(:motorcycle_model).permit(:name, :motorcycle_make_id)
    end
end
