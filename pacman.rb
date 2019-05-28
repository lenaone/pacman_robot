class Pacman
  
  attr_accessor :x, :y, :f

  def initialize(x,y,f)
    @x = x || 0 
    @y = y || 0 
    @f = f 
  end

  def move
    case @f
    when "WEST"
      @x -= 1
    when "EAST"
      @x += 1
    when "SOUTH"
      @y -= 1
    when "NORTH"
      @y += 1
    end
  end

  
  def left
    facing_left = ["NORTH","WEST","SOUTH","EAST"]
    index = facing_left.index(f) == 3 ? 0 : facing_left.index(f) + 1
    @f = facing_left[index]
  end

  def right
    facing_right = ["NORTH","EAST","SOUTH","WEST"]
    index = facing_right.index(f) == 3 ? 0 : facing_right.index(f) + 1
    @f = facing_right[index]
  end

  def report
    "#{@x},#{@y},#{@f}"
  end
end

input = ''
while input !~ /exit/i
  puts 'TYPE INPUT (EXIT TO QUIT):'
  input = gets.chomp

  if input =~ /PLACE/
    moves = input.split.slice(1).scan(/\w+/)
    x = moves[0].to_i
    y = moves[1].to_i
    facing = moves[2]
    my_pacman = Pacman.new(x,y,facing)
  end

  if input =~ /LEFT/
    my_pacman.left
  end

  if input =~ /RIGHT/
    my_pacman.right
  end

  if input =~ /MOVE/
    my_pacman.move
  end

  if input =~ /REPORT/
   puts my_pacman.report
  end
end



