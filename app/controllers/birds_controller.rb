class BirdsController < ApplicationController

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

  def create 
    bird = Bird.create(bird_params)
    if bird.valid?
      render json: bird, status: :created
    else 
      render json: { errors: bird.error.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy 
    bird = Bird.find(id: params[:id])
    bird.delete
  end

  private
  
  def bird_params
    params.permit(:name, :species)
  end
end