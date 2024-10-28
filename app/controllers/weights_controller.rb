class WeightsController < ApplicationController
  def index
    @weights = UserWeight.all

    p @weights
  end
end
