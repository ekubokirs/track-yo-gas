class CarController < ApplicationController
  before_action :authenticated_user!
  before_action :navigation_type

  def index
    @cars = current_user.cars
  end

  def new
    @car = Car.new
    @errors = 'noErrors'
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user

    @car.save
    if @car.errors.any?
      render  :new
      @user = current_user
      @errors = 'errors'
    else
      redirect_to cars_url
      flash[:notice] = "Car Created"
    end
  end

  def edit
  end

  def update
  end

  def destroy
    car = Car.find(params[:id])
    car.destroy

    redirect_to cars_url
    flash[:notice] = "Car Deleted"
  end

  def car_params
    params.require(:car).permit(
      :make,
      :brand,
      :year,
      :color
      )
  end
end
