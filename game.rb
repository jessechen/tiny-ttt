require_relative 'board'
require_relative 'move'

class Game
  def initialize
    @board = Board.new
    @current_player = -1
  end

  def show_intro
    intro = %{
Tiny tic-tac-toe
----------------

Pick a space on your turn ('q' to quit):

 1 | 2 | 3
-----------
 4 | 5 | 6
-----------
 7 | 8 | 9

}
    puts intro
  end

  def finished
    @board.winner || @move && @move.quit_request?
  end

  def show_state
    puts @board.show
  end

  def take_input
    puts "\n#{Board::VISUAL_REPRESENTATION[@current_player]} player's turn:"
    @move = Move.new(gets.chomp, @current_player)

    unless @move.valid?
      puts "\nPlease pick a space from 1-9, or 'q' to quit."
      return
    end

    unless @board.make @move
      puts "\nSorry, there's already something in space #{@move.raw_input}."
      return
    end

    @current_player = -@current_player
  end

  def show_outro
    return unless @board.winner

    puts @board.show
    if @board.winner == 0
      puts "\nIt's a tie!"
    else
      puts "\n#{Board::VISUAL_REPRESENTATION[@board.winner]} wins!"
    end
  end
end
