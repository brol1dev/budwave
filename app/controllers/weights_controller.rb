class WeightsController < ApplicationController
  def index
    @weights = UserWeight.all
  end

  def show
    @user_weight = UserWeight.find(params[:id])
  end
end
