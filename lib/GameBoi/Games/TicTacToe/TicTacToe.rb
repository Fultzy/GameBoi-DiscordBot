
######################
class GameState
  attr_reader :game_over, :players,

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @counter = 1
    # player names and score in hash
    @players = {
      player1 => 0,
      player2 => 0
    }
    @grid_hash = {
      # col:       1    2    3
      '1' => [' ', ' ', ' '], # top
      '2' => [' ', ' ', ' '], # mid
      '3' => [' ', ' ', ' ']  # bot
    }
  end

  def place_marker(x, y)
    val = x.to_i - 1
    key = y
    row_arry = @grid_hash[key]
    if row_arry[val] == ' '
      if @counter.odd?
        # player 1 #
        row_arry[val] = 'x'
        end_turn
      else
        # player 2 #
        row_arry[val] = 'o'
        end_turn
      end
    else
      p 'location taken'
    end
  end
  ######################

  def clear_grid
    @couter = 1
    @grid_hash = {
      # col:       1    2    3
      '1' => [' ', ' ', ' '], # top
      '2' => [' ', ' ', ' '], # mid
      '3' => [' ', ' ', ' ']  # bot
    }
  end

  def end_turn
    win?
    counter_up
  end

  def player
    @player = @counter.odd? ? @player1 : @player2
  end

  ######################
  # win condition check & +1 to player score
  def win?
    @counter == 6 #???? Wtf ???
    @players[player] += 1
  end

  ######################
  # Hook for Bot inputs instead of terminal
  def input_request
    # grid_print

    place_marker(row, col)
  end

  def grid_print
    event << @grid_hash[0]
    event << @grid_hash[1]
    event << @grid_hash[2]
  end
end
