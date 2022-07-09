class Plateau
  attr_accessor :x, :y

  def initialize(x_size, y_size)
    @x = x_size
    @y = y_size
  end

  def can_move_to?(x_to, y_to)
    inside_measures?(x_to, y_to)
  end

  private

  def inside_measures?(x_to, y_to)
    (x_to >= 0 and x_to <= x) and (y_to >= 0 and y_to <= y)
  end
end
