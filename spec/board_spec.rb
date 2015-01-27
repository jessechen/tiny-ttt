require_relative '../board'

describe Board do
  describe '#show' do
    it 'produces a string representation of an empty board' do
      expect(Board.new.show).to have_same_stripped_lines(%{
   |   |
-----------
   |   |
-----------
   |   |

})
    end

    it 'represents -1s as Xs and 1s as Os' do
      expect(Board.new([[-1, -1,  1],
                        [ 0,  1,  0],
                        [ 1, -1,  0]]).show).to have_same_stripped_lines(%{
 X | X | O
-----------
   | O |
-----------
 O | X |

})
    end
  end

  describe '#filled?' do
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
    end

    it 'is 0 if the board is filled' do
      expect(Board.new([[ 1, -1,  1],
                        [ 1, -1, -1],
                        [-1,  1, -1]]).winner).to eq(0)
    end

    it 'is set if a player wins horizontally' do
      expect(Board.new([[ 0,  1,  1],
                        [-1, -1, -1],
                        [ 0,  0,  0]]).winner).to eq(-1)
    end

    it 'is set if a player wins vertically' do
      expect(Board.new([[-1, -1,  1],
                        [ 0, -1,  1],
                        [ 0,  0,  1]]).winner).to eq(1)
    end

    it 'is set if a player wins diagonally' do
      expect(Board.new([[-1,  0,  1],
                        [ 0, -1,  1],
                        [ 0,  0, -1]]).winner).to eq(-1)

      expect(Board.new([[-1, -1,  1],
                        [ 0,  1,  0],
                        [ 1, -1,  0]]).winner).to eq(1)
    end
  end
end

RSpec::Matchers.define :have_same_stripped_lines do
  match do |actual|
    lines_are_equal = actual.lines.zip(expected.lines).map do |actual_line, expected_line|
      actual_line.strip == expected_line.strip
    end

    lines_are_equal.all?
  end
end
