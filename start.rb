require './plateau'
require './rover'

plateau = Plateau.new(5, 5)
rover = Rover.new(1, 2, 'N', plateau)

def get_input
  print 'Type command: '
  gets.chomp
end

input = get_input
while input != 'exit'
  rover.send(input)
  input = get_input
end
