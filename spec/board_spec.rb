require_relative '../board'

describe Board do
  describe '#full?' do
    it 'is true if all spaces are nonzero' do
      expect(Board.new([[ 1, -1,  1],
                        [ 1, -1, -1],
                        [-1,  1, -1]]).filled?).to eq(true)
    end

    it 'is false otherwise' do
      expect(Board.new([[ 1, -1,  1],
                        [ 1, -1, -1],
                        [ 0,  1, -1]]).filled?).to eq(false)

      expect(Board.new([[ 0,  0,  0],
                        [ 0,  0,  0],
                        [ 0,  0,  0]]).filled?).to eq(false)
    end
  end

  describe '#winner' do
    it 'is nil if there is no winner yet' do
      expect(Board.new([[ 0,  0,  0],
                        [ 0,  0,  0],
                        [ 0,  0,  0]]).winner).to be_nil

      expect(Board.new([[ 1, -1,  1],
                        [ 1, -1, -1],
                        [-1,  1, -1]]).winner).to be_nil
    end

    it 'is set if a player wins horizontally' do
      expect(Board.new([[ 0,  1,  1],
                        [-1, -1, -1],
                        [ 0,  0,  0]]).winner).to eq(-1)
    end

    it 'is set if a player wins vertically' do
      expect(Board.new([[-1, -1,  1],
                        [-1, -1,  1],
                        [ 0,  0,  1]]).winner).to eq(1)
    end

    it 'is set if a player wins diagonally' do
      expect(Board.new([[-1,  0,  1],
                        [ 0, -1,  1],
                        [ 0,  0, -1]]).winner).to eq(-1)

      expect(Board.new([[-1, -1,  1],
                        [-1,  1,  0],
                        [ 1,  0, -1]]).winner).to eq(1)
    end
  end

  describe '#show' do

  end
end