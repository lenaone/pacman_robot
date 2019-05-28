class Pacman
  
  attr_accessor :x, :y, :f

  FACING = ["NORTH","SOUTH","EAST","WEST"]

  def place(x,y,f)
    if x >= 0 && x < 6 && y >= 0 && y < 6 && FACING.include?(f)
      @x = x
      @y = y
      @f = f
    end
  end

  def move
    case @f
    when "WEST"
      @x -= 1 if @x >= 1 
    when "EAST"
      @x += 1 if @x <= 4
    when "SOUTH"
      @y -= 1 if @y >= 1
    when "NORTH"
      @y += 1 if @y <= 4
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
    if @x == nil && @y == nil
      'Not placed'
    else
      "#{@x},#{@y},#{@f}"
    end
  end

end

my_pacman = Pacman.new
input = ''
while input !~ /exit/i
  puts 'TYPE INPUT (EXIT TO QUIT):'
  input = gets.chomp
  
  if input =~ /PLACE/
    if input.split.slice(1) != nil
      moves = input.split.slice(1).split(',')
      x = moves[0].to_i
      y = moves[1].to_i
      facing = moves[2]
      my_pacman.place(x,y,facing)
    end
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



