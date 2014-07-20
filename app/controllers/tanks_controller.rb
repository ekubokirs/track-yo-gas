class TanksController < ApplicationController

  def index
    @tanks = current_user.tank.all
  end

  def new
    @tanks  = Tank.new
    @cars   = current_user.cars
    @errors = "noErrors"
  end

  def create
    @tank       = Tank.new(tank_params)
    @tank.user  = current_user

    @tank.save
    if @tank.errors.any?
      render :new
      @user   = current_user
      @errors = "errors"
    else
      redirect_to root_url
      flash[:notice] = "Tank Created"
    end
  end

  def show
    @tank = Tank.find(params[:id])
  end

  def edit
    @tank   = Tank.find(params[:id])
    @errors = "noErrors"
  end

  def update
    @tank = Tank.find(params[:id])
    @tank.update_attributes(tank_params)

    @tank.save
    if @tank.errors.any?
      render :new
      @user   = current_user
      @errors = "errors"
    else
      redirect_to root_url
      flash[:notice] = "Tank Details Updated"
    end
  end

  def destroy
    tank = Tank.find(params[:id])
    tank.destroy

    redirect_to root_url
    flash[:notice] = "Tank Deleted"
  end

  private
  def tank_params
    params.require(:tank).permit(
      :car_id,
      :amount,
      :price,
      :current_miles
      )
  end
end
