require_relative 'cell.rb'

class Grid
  attr_reader :cells, :size

  def initialize(size)
    @size = size
    @cells = []
    (0..20).each do |x|
      (0..20).each do |y|
        @cells.push(Cell.new(x.to_f, y.to_f))
      end
    end
  end

  def total_coverage_quality(base_stations)
    count = 0
    sum = 0
    @cells.each do |cell|
      coverage = cell.coverage(base_stations)
      sum, count = sum + coverage, count + 1
    end
    sum/count
  end

  def in_grid(cell)
    if cell.x <= size && cell.x >= 0 && cell.y <= size && cell.y >= 0
      return true
    end
    false
  end

end