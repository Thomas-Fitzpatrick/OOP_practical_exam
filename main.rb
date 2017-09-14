require './base_stations.rb'
require './base_station.rb'
require './cell.rb'
require './grid.rb'


base_stations = Base_stations.new

file_obj = File.new("base_stations.txt", "r")

puts "Question 1:"
while line = file_obj.gets
  name, x, y = line.split(' ')
  base_station = Base_station.new(name, Cell.new(x.to_f, y.to_f))
  base_stations.add_base_station(base_station)
end

puts base_stations
puts "\n\nQuestion 2"

grid = Grid.new(20)
weak_total = 0
medium_total = 0
strong_total = 0
count = 0
grid.cells.each do |cell|
  coverage = cell.coverage_catagory(base_stations)
  if coverage == :weak
    weak_total += 1
  elsif coverage == :medium
    medium_total += 1
  elsif coverage == :strong
    strong_total += 1
  end
  count += 1
end

puts "number of cells with weak coverage: #{weak_total}"
puts "number of cells with medium coverage: #{medium_total}"
puts "number of cells with strong coverage: #{strong_total}"
puts "\n\nQuestion 3:"



file_obj = File.new("route.txt", "r")
sum = 0.0
cells_on_route = 0.0
while line = file_obj.gets
  x, y = line.split(' ')
  cell = Cell.new(x.to_f, y.to_f)
  print "#{cell.coverage_catagory(base_stations)} "
  sum, cells_on_route = sum + cell.coverage(base_stations), cells_on_route + 1
end
puts "\naverage coverage along route: #{sum/cells_on_route}"
puts "\n\nQuestion 4"

10.times do
  base_stations.base_stations.each do |base_station|
   tcq = grid.total_coverage_quality(base_stations)
   base_station.cell.adjacent_cells.each do |adjacent_cell|
     if grid.in_grid(adjacent_cell)
      base_station.move_station(adjacent_cell.x, adjacent_cell.y)
      new_tcq = grid.total_coverage_quality(base_stations)
      if new_tcq > tcq
        puts new_tcq
        break
      end
     end
   end
  end
end


# puts base_stations
# c = Cell.new(0, 0)
# p = Cell.new(5, 5)
# t = Base_station.new("test", Cell.new(5, 5))
# b = Base_stations.new
# b.add_base_station(t)
# puts p.distance_to(c)
# puts c.coverage(b)
