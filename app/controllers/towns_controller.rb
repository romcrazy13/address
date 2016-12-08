class TownsController < ApplicationController
  before_action :set_town, only: [:show, :edit, :update, :destroy]

  def index
    @towns = Town.all.order("town_name")
  end

  def show
  end

  def new
    @town = Town.new
  end

  def edit
  end

  def create
    @town = Town.new(town_params)
    respond_to do |format|
      if @town.save
        format.html { redirect_to @town, notice: 'Town was successfully created.' }
        format.json { render :show, status: :created, location: @town }
      else
        format.html { render :new }
        format.json { render json: @town.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @town.update(town_params)
        format.html { redirect_to @town, notice: 'Town was successfully updated.' }
        format.json { render :show, status: :ok, location: @town }
      else
        format.html { render :edit }
        format.json { render json: @town.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @town.destroy
    respond_to do |format|
      format.html { redirect_to towns_url, notice: 'Town was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_town
    @town = Town.find(params[:id])
  end

  def town_params
    params.require(:town).permit(:town_name)
  end

end
