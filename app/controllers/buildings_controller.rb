class BuildingsController < ApplicationController
  before_action :set_building, only: [:show, :edit, :update, :destroy]

  def index
    get_data
  end

  def show
  end

  def new
    @building = Building.new
    get_data
    @town_id = @towns.first.id
    @streets = Street.where(town_id: @town_id).order("street_name")
  end

  def edit
    get_data
    @street_id = @building.street_id
    @town_id = @streets.find(@street_id).town_id
  end

  def create
    @building = Building.new(building_params)
    respond_to do |format|
      if @building.save
        format.html { redirect_to @building, notice: 'Building was successfully created.' }
        format.json { render :show, status: :created, location: @building }
      else
        format.html { render :new }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @building.update(building_params)
        format.html { redirect_to @building, notice: 'Building was successfully updated.' }
        format.json { render :show, status: :ok, location: @building }
      else
        format.html { render :edit }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @building.destroy
    respond_to do |format|
      format.html { redirect_to building_url, notice: 'Building was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_data
    @towns = Town.all.order("town_name")
    @streets = Street.all.order("street_name")
    @buildings = Building.all.order("number")
  end

  private
  def set_building
    @building = Building.find(params[:id])
  end

  def building_params
    params.require(:building).permit(:number, :have_flet, :street_id, :town_id)
  end

end
