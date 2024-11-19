class WeightsController < ApplicationController
  def index
    @weights = UserWeight.all
  end

  def show
    @user_weight = UserWeight.find(params[:id])
  end

  def new
    @user_weight = UserWeight.new
  end

  def create
    @user_weight = UserWeight.new(weight_params)
    
    if @user_weight.save
      redirect_to weights_path
    else
      render :new
    end
  end

  private

  def weight_params
    params.require(:user_weight).permit(:weight_kg, :date)
  end
end
