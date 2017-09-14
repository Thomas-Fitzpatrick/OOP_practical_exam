require 'test/unit'
require_relative 'cell.rb'

class Cell_test < Test::Unit::TestCase
  def setup
    @cell = Cell.new(1,2)
  end

  def test_initialize
    assert_equal(1, @cell.x, 'x value set incorrectly')
    assert_equal(2, @cell.y, 'y value set incorrectly')
  end

  def test_equal
    new_cell = Cell.new(1,2)
    assert(@cell==new_cell, 'Equality check doesnt work')
  end

  def test_to_s
    assert_equal('(1,2)', @cell.to_s, 'to_s not working correctly')
  end
end