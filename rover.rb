class Rover
  COORDINATES = %w[N E S W].freeze

  attr_accessor :heading, :plateau, :x, :y

  def initialize(x_position, y_position, heading, plateau)
    @x = x_position
    @y = y_position
    @heading = heading
    @plateau = plateau
  end

  def send(command)
    analyze_command(command)
    # print 'Can move to: '
    # puts plateau.can_move_to?
  rescue RuntimeError => e
    puts e.message
  end

  def rotate_right
    @heading = COORDINATES[COORDINATES.find_index(heading) - 3]
  end

  def rotate_left
    @heading = COORDINATES[COORDINATES.find_index(heading) - 1]
  end

  def move
    raise 'Coordinates outside of plateau' unless plateau.can_move_to? *destination_coordinates

    @x, @y = destination_coordinates
  end

  def position
    puts "#{x} #{y} #{@heading}"
  end

  def destination_coordinates
    case heading
    when 'N'
      [x, y + 1]
    when 'E'
      [x + 1, y]
    when 'S'
      [x, y - 1]
    when 'W'
      [x - 1, y]
    end
  end

  def analyze_command(command)
    case command
    when 'L'
      rotate_left
    when 'R'
      rotate_right
    when 'M'
      move
    else
      raise 'Not valid command'
    end
  end
end
