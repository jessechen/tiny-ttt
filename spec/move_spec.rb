require_relative '../move'

describe Move do
  describe '#valid?' do
    it "is true if the raw input is a quit request" do
      expect(Move.new('q', -1).valid?).to eq(true)
    end

    it "is true if the raw input can be coerced into an integer from 1 to 9" do
      expect(Move.new('1', -1).valid?).to eq(true)
      expect(Move.new('9', 1).valid?).to eq(true)
      expect(Move.new("\n 5  ", -1).valid?).to eq(true)
      expect(Move.new('1abc', nil).valid?).to eq(true)
    end

    it "is false otherwise" do
      expect(Move.new('10', -1).valid?).to eq(false)
      expect(Move.new('abc1', 1).valid?).to eq(false)
      expect(Move.new('quit', -1).valid?).to eq(false)
      expect(Move.new('', -1).valid?).to eq(false)
    end
  end

  describe '#quit_request?' do
    it "is true if the raw input can be coerced into 'q'" do
      expect(Move.new('q', -1).quit_request?).to eq(true)
      expect(Move.new('Q', 1).quit_request?).to eq(true)
      expect(Move.new("\n q  ", nil).quit_request?).to eq(true)
    end

    it "is false otherwise" do
      expect(Move.new('QQ', -1).quit_request?).to eq(false)
      expect(Move.new('1', 1).quit_request?).to eq(false)
      expect(Move.new('quit', -1).quit_request?).to eq(false)
      expect(Move.new('T_T', 1).quit_request?).to eq(false)
    end
  end

  describe '#initialize' do
    it "calculates the x and y coordinates for valid moves" do
      expect(Move.new('1', -1)).to have_coordinates([0, 0])
      expect(Move.new('2',  1)).to have_coordinates([1, 0])
      expect(Move.new('3', -1)).to have_coordinates([2, 0])
      expect(Move.new('4',  1)).to have_coordinates([0, 1])
      expect(Move.new('5', -1)).to have_coordinates([1, 1])
      expect(Move.new('6',  1)).to have_coordinates([2, 1])
      expect(Move.new('7', -1)).to have_coordinates([0, 2])
      expect(Move.new('8',  1)).to have_coordinates([1, 2])
      expect(Move.new('9', -1)).to have_coordinates([2, 2])
      expect(Move.new('10', 1)).to have_coordinates([nil, nil])
    end
  end
end

RSpec::Matchers.define :have_coordinates do
  match do |actual|
    actual.x == expected.first && actual.y == expected.last
  end
end
