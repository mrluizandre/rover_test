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
  rescue RuntimeError => e
    puts e.message
  end

  def rotate_right
    @heading = COORDINATES[COORDINATES.find_index(heading) - 3]
  end

  def rotate_left
    @heading = COORDINATES[COORDINATES.find_index(heading) - 1]
  end

  def analyze_command(command)
    case command
    when 'L'
      rotate_left
    when 'R'
      rotate_right
    when 'M'
      puts 'Move'
    else
      raise 'Not valid command'
    end
    puts "(#{x},#{y}): #{@heading}"
  end
end
