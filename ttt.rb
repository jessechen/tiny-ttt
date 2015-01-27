require_relative 'game'

game = Game.new
game.show_intro
until game.finished do
  game.show_state
  game.take_input
end
game.show_outro
