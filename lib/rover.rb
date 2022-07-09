require_relative 'errors'

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
    run_command(command)
  end

  def position
    "#{x} #{y} #{@heading}"
  end

  private

  def rotate_right
    @heading = COORDINATES[COORDINATES.find_index(heading) - 3]
  end

  def rotate_left
    @heading = COORDINATES[COORDINATES.find_index(heading) - 1]
  end

  def move
    unless plateau.can_move_to?(*destination_coordinates)
      raise CoordinatesOutsideOfPlateauError, "destination outside of (#{x},#{y})"
    end

    @x, @y = destination_coordinates
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

  def run_command(command)
    case command
    when 'L'
      rotate_left
    when 'R'
      rotate_right
    when 'M'
      move
    else
      raise RoverCommandDoesNotExistError, "\"#{command}\" command does not exist"
    end
  end
end
