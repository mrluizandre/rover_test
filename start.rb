require './plateau'
require './rover'

# Plateau line
input = gets.chomp.split(' ')
plateau_x = input[0].to_i
plateau_y = input[1].to_i
plateau = Plateau.new(plateau_x, plateau_y)

# Rover 1 line
input = gets.chomp.split(' ')
rover_x = input[0].to_i
rover_y = input[1].to_i
rover_heading = input[2]

rover1 = Rover.new(rover_x, rover_y, rover_heading, plateau)

# Rover 1 command line
command_line = gets.chomp.strip.gsub(' ','')

command_line.split('').each do |command|
  rover1.send(command)
end

# Rover 2 line
input = gets.chomp.split(' ')
rover_x = input[0].to_i
rover_y = input[1].to_i
rover_heading = input[2]

rover2 = Rover.new(rover_x, rover_y, rover_heading, plateau)

# Rover 2 command line
command_line = gets.chomp.strip.gsub(' ','')

command_line.split('').each do |command|
  rover2.send(command)
end

rover1.position
rover2.position
