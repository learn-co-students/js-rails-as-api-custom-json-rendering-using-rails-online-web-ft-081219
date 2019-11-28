class BirdsController < ApplicationController
  def index
    birds = Bird.all
    # render json: birds

    # to render/show only what we specify:
    # render json: birds, only: [:id, :name, :species]

    # another way to specify what we want to hide:
    render json: birds, except: [:created_at, :updated_at]
    # render json: birds.to_json(except: [:created_at, :updated_at])
  end

  def show
    bird = Bird.find_by(id: params[:id])
    # render json: bird

    # we could just pick and choose what we want to send:
    # render json: {id: bird.id, name: bird.name, species: bird.species } 

    # another way of specifying what to show:
    # render json: bird.slice(:id, :name, :species)


    # to show any error comes up while showing specific bird:
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
    end
  end
end