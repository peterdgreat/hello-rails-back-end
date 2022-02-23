class Api::V1::GreetingsController < ApplicationController
  def index
    id = rand(1..Greeting.count)
    @greeting = Greeting.find(id)
    render json: @greeting
  end

  def create
    greeting = Greeting.new(greeting_params)
    if greeting.save
      render json: greeting, status: 201
    else
      render json: { errors: greeting.errors }, status: 422
    end
  end

  private

  def greeting_params
    params.require(:greeting).permit(:title)
  end
end
