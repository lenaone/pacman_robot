require 'minitest/autorun'
require_relative 'pacman'

class PacmanTest < Minitest::Test

  def test_report
    my_pacman = Pacman.new
    my_pacman.place(0,0,"NORTH")
    assert_equal "0,0,NORTH", my_pacman.report
  end

  def test_example_a
    my_pacman = Pacman.new
    my_pacman.place(0,0,"NORTH")
    my_pacman.move
    assert_equal "0,1,NORTH", my_pacman.report
  end

  def test_example_b
    my_pacman = Pacman.new
    my_pacman.place(0,0,'NORTH')
    my_pacman.left
    assert_equal "0,0,WEST", my_pacman.report
  end

  def test_example_c
    my_pacman = Pacman.new
    my_pacman.place(1,2,'EAST')
    my_pacman.move
    my_pacman.move
    my_pacman.left
    my_pacman.move
    assert_equal "3,3,NORTH", my_pacman.report
  end

  def test_left_from_west
    my_pacman = Pacman.new
    my_pacman.place(0,0,'WEST')
    my_pacman.left
    assert_equal "0,0,SOUTH", my_pacman.report
  end

  def test_left_from_east
    my_pacman = Pacman.new
    my_pacman.place(0,0,'EAST')
    my_pacman.left
    assert_equal "0,0,NORTH", my_pacman.report
  end

  def test_left_from_south
    my_pacman = Pacman.new
    my_pacman.place(0,0,'SOUTH')
    my_pacman.left
    assert_equal "0,0,EAST", my_pacman.report
  end

  def test_right_from_north
    my_pacman = Pacman.new
    my_pacman.place(0,0,'NORTH')
    my_pacman.right
    assert_equal "0,0,EAST",my_pacman.report
  end

  def test_right_from_east
    my_pacman = Pacman.new
    my_pacman.place(0,0,'EAST')
    my_pacman.right
    assert_equal "0,0,SOUTH", my_pacman.report
  end

  def test_right_from_south
    my_pacman = Pacman.new
    my_pacman.place(0,0,'SOUTH')
    my_pacman.right
    assert_equal "0,0,WEST", my_pacman.report
  end

  def test_right_from_west
    my_pacman = Pacman.new
    my_pacman.place(0,1,'WEST')
    my_pacman.right
    assert_equal "0,1,NORTH", my_pacman.report
  end

  def test_invalid_move_west
    my_pacman = Pacman.new
    my_pacman.place(0,0,'NORTH')
    my_pacman.left
    my_pacman.move
    assert_equal "0,0,WEST", my_pacman.report
  end

  def test_invalid_move_south
    my_pacman = Pacman.new
    my_pacman.place(0,0,'EAST')
    my_pacman.right
    my_pacman.move
    assert_equal "0,0,SOUTH", my_pacman.report
  end

  def test_invalid_move_over_grid
    my_pacman = Pacman.new
    my_pacman.place(6,6,'NORTH')
    assert_equal "Not placed", my_pacman.report
  end

  def test_invalid_move_with_minus
    my_pacman = Pacman.new
    my_pacman.place(-1,-3,'NORTH')
    assert_equal "Not placed", my_pacman.report
  end

  def test_with_invalid_facing
    my_pacman = Pacman.new
    my_pacman.place(1,2,'HELLO')
    assert_equal "Not placed", my_pacman.report
  end

end