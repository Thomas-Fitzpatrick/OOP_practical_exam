class Cell
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def ==(other_point)
    if x == other_point.x && y == other_point.y
      return true
    end
    return false
  end

  def to_s
    "(#{@x},#{@y})"
  end

  def coverage(base_stations)
    nearest_station = base_stations.nearest_station_to(self)
    (1/(1 + distance_to(nearest_station.cell)))
  end

  def coverage_catagory(base_stations)
    coverage = coverage(base_stations)
    catagory = :failed_catagory_calculation
    if coverage > 0.3
      catagory = :strong
    elsif coverage <= 0.3 && coverage > 0.1
      catagory = :medium
    elsif coverage <= 0.1
      catagory = :weak
    end
    catagory
  end

  def distance_to (other_cell)
    x_diff = ((@x + 0.5) - (other_cell.x + 0.5))
    y_diff = ((@y + 0.5) - (other_cell.y + 0.5))
    #puts Math.sqrt((x_diff*x_diff) + (y_diff*y_diff))
    Math.sqrt((x_diff*x_diff) + (y_diff*y_diff))
  end

  def move_cell(x, y)
    @x = x
    @y = y
  end

  def adjacent_cells
    cells = []
    cells.push(Cell.new(@x + 1, @y + 1))
    cells.push(Cell.new(@x + 1, @y - 1))
    cells.push(Cell.new(@x - 1, @y + 1))
    cells.push(Cell.new(@x - 1, @y - 1))
    cells.push(Cell.new(@x + 1, @y))
    cells.push(Cell.new(@x, @y + 1))
    cells.push(Cell.new(@x - 1, @y))
    cells.push(Cell.new(@x, @y - 1))
    cells
  end
end