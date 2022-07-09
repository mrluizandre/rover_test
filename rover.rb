class Rover
  COORDINATES = %w[N E S W].freeze

  attr_accessor :heading, :plateau, :x, :y

  def initialize(x_position, y_position, heading, plateau)
    @x = x_position
    @y = y_position
    @heading = heading
    @plateau = plateau
  end
end
