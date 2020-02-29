class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6],
  ]

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(position, player_char)
    @board[position] = player_char
  end

  def position_taken?(position)
    @board[position] == "X" || @board[position] == "O"
  end

  def valid_move?(position)
     !position_taken?(position) && position.between?(0, 8)
  end

  def turn_count
    counter = 0
    @board.each do |position|
      if position == "X" || position == "O"
        counter += 1
      end
    end
    counter
  end

  def current_player
    turn_number = turn_count
    if turn_number % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def turn
    user_input = gets.chomp
    position = input_to_index(user_input)
    if valid_move?(position)
      player_char = current_player
      move(position, player_char)
    else
      turn
    end
  end

end
