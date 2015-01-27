class Move
  attr_reader :raw_input, :player, :x, :y

  def initialize(raw_input, player)
    @raw_input = raw_input
    @player = player
    calculate_coordinates if valid?
  end

  def valid?
    quit_request? || (1..9).include?(@raw_input.to_i)
  end

  def quit_request?
    @raw_input.strip.downcase == 'q'
  end

  private

  def calculate_coordinates
    flattened_spaces_index = @raw_input.to_i - 1
    @x = flattened_spaces_index % 3
    @y = flattened_spaces_index / 3
  end
end
