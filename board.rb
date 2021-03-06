require_relative 'move'

class Board
  VISUAL_REPRESENTATION = {-1 => 'X', 1 => 'O', 0 => ' '}

  def initialize(spaces = nil)
    @spaces = spaces || [[0, 0, 0],
                         [0, 0, 0],
                         [0, 0, 0]]
  end

  def show
    (0..2).map { |row_number| show_row(row_number) }.join("\n")
  end

  def filled?
    !(@spaces.flatten.include? 0)
  end

  def winner
    row_sums = @spaces.map { |row| row.reduce(:+) }
    col_sums = [@spaces[0][0] + @spaces[1][0] + @spaces[2][0],
                @spaces[0][1] + @spaces[1][1] + @spaces[2][1],
                @spaces[0][2] + @spaces[1][2] + @spaces[2][2]]
    diag_sums = [@spaces[0][0] + @spaces[1][1] + @spaces[2][2],
                 @spaces[2][0] + @spaces[1][1] + @spaces[0][2]]
    sums = [row_sums, col_sums, diag_sums].flatten

    return 1 if sums.include? 3
    return -1 if sums.include? -3
    return 0 if filled?
    nil
  end

  def make(move)
    return false unless legal? move
    @spaces[move.y][move.x] = move.player
  end

  def legal?(move)
    return false unless move.valid?
    @spaces[move.y][move.x] == 0
  end

  private

  def show_row(row_number)
    filler_row = (row_number == 0 ? '' : '-----------')
    important_row = (0..2).map { |col_number| VISUAL_REPRESENTATION[@spaces[row_number][col_number]] }.join(' | ')
    filler_row + "\n " + important_row
  end
end