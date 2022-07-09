require 'plateau'

RSpec.describe Plateau do
  let(:plateau) { Plateau.new(5, 5) }

  it 'it show allow move' do
    plateau = Plateau.new(5, 5)
    expect(plateau.can_move_to?(5, 5)).to eq(true)
  end

  it 'it show NOT allow move' do
    plateau = Plateau.new(5, 5)
    expect(plateau.can_move_to?(6, 6)).to eq(false)
  end
end
