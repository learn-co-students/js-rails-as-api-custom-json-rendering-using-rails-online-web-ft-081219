class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird, only:[:id, :native, :species]
    else
      render json: {message:'Bird not found'}
    end
    render json: bird
  end
end