class MainController < ApplicationController

  def index
    getdata
  end

  def getdata
    @towns = Town.all.order("town_name")
    @streets = Street.all.order("street_name")
    @buildings = Building.all.order("number")
  end

end
