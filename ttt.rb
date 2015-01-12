require_relative 'board'

intro = %{
Tiny tic-tac-toe
----------------

Pick a space on your turn ('q' to quit):

 0,0 | 0,1 | 0,2
-----------------
 1,0 | 1,1 | 1,2
-----------------
 2,0 | 2,1 | 2,2

}

puts intro
board = Board.new
until board.winner do
  puts board.show
  puts "\nX player's turn"
  input = gets.chomp
end