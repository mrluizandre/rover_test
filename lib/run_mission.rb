require_relative 'plateau'
require_relative 'rover'

print 'Enter the Plateau definition line (e.g. "N N"): '
input = gets.chomp.split(' ')
plateau_x = input[0].to_i
plateau_y = input[1].to_i
plateau = Plateau.new(plateau_x, plateau_y)

print 'Enter the Rover 1 definition line (e.g. "N N H"): '
input = gets.chomp.split(' ')
rover_x = input[0].to_i
rover_y = input[1].to_i
rover_heading = input[2]

rover1 = Rover.new(rover_x, rover_y, rover_heading, plateau)

print 'Enter the Rover 1 command line: (e.g. "LMRMRMLMLMMM"): '
command_line = gets.chomp.strip.gsub(' ','')

command_line.split('').each do |command|
  rover1.send(command)
end

print 'Enter the Rover 2 definition line (e.g. "N N H"): '
input = gets.chomp.split(' ')
rover_x = input[0].to_i
rover_y = input[1].to_i
rover_heading = input[2]

rover2 = Rover.new(rover_x, rover_y, rover_heading, plateau)

print 'Enter the Rover 2 command line (e.g. "LMRMRMLMLMMM"): '
command_line = gets.chomp.strip.gsub(' ', '')

command_line.split('').each do |command|
  rover2.send(command)
end

puts rover1.position
puts rover2.position
