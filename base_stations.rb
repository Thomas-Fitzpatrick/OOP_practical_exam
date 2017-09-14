require_relative 'base_station.rb'

Mapsize = 20

class Base_stations
  attr_reader :base_stations

  def initialize
    @base_stations = []
  end

  def add_base_station(base_station)
    @base_stations.push(base_station)
  end

  def to_s
    output = ""
    @base_stations.each do |base_station|
      output += base_station.to_s + " "
    end
    output
  end

  def nearest_station_to(cell)
    least_distance = Mapsize
    nearest_station = nil
    @base_stations.each do |base_station|
      if cell.distance_to(base_station.cell) < least_distance
        nearest_station = base_station
      end
    end
    #puts nearest_station.cell.class
    nearest_station
  end
end