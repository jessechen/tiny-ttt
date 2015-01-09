class Board
  def initialize(spaces = nil)
    @spaces = spaces || [[0, 0, 0],
                         [0, 0, 0],
                         [0, 0, 0]]
  end

  def winner
    row_sums = @spaces.map { |row| row.reduce(:+) }
    col_sums = (0..2).map do |i|
      (0..2).reduce(0) do |acc, j|
        acc + @spaces[j][i]
      end
    end
    diag_sums = [@spaces[0][0] + @spaces[1][1] + @spaces[2][2],
                 @spaces[2][0] + @spaces[1][1] + @spaces[0][2]]
    sums = [row_sums, col_sums, diag_sums].flatten

    return 1 if sums.include? 3
    return -1 if sums.include? -3
    nil
  end

  def filled?
    !(@spaces.flatten.include? 0)
  end

  def show

  end
end