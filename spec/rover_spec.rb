require 'rover'

RSpec.describe Rover do
  context 'passing valid parameters' do
    let(:rover) { Rover.new(1, 2, 'S', nil) }

    it 'should initialize rover in the given position' do
      expect(rover.position).to eq('1 2 S')
    end

    it 'should turn to east' do
      rover.send('L')
      expect(rover.position).to eq('1 2 E')
    end

    it 'should turn to west' do
      rover.send('R')
      expect(rover.position).to eq('1 2 W')
    end

    it 'should turn to north' do
      rover.send('R')
      rover.send('R')
      expect(rover.position).to eq('1 2 N')
    end

    it 'should turn to south' do
      rover.send('R')
      rover.send('R')
      rover.send('R')
      rover.send('R')
      expect(rover.position).to eq('1 2 S')
    end

    it 'should move 1 square' do
      plateau = double('plateau')
      allow(plateau).to receive(:can_move_to?).and_return(true)

      rover = Rover.new(1, 2, 'S', plateau)
      rover.send('M')

      expect(rover.position).to eq('1 1 S')
    end
  end

  context 'passing invalid inputs' do
    let(:plateau) do
      plateau = double('plateau')
      allow(plateau).to receive(:can_move_to?).and_return(false)
      plateau
    end

    let(:rover) { Rover.new(5, 5, 'S', plateau) }

    it 'should not move outside plateau' do
      expect { rover.send('M') }.to raise_error(CoordinatesOutsideOfPlateauError)
    end

    it 'should not accpet invalid move/rotate commands' do
      expect { rover.send('X') }.to raise_error(RoverCommandDoesNotExistError)
    end
  end
end
