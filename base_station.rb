require_relative 'cell.rb'

class Base_station
  attr_reader :name, :cell

  def initialize(name, cell)
    @name = name
    @cell = cell
  end

  def to_s
    "#{@name} #{@cell}"
  end

  def move_station(x, y)
    @cell.move_cell(x, y)
  end
end