
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


board = [" "," "," "," "," "," "," "," "," "]
display_board(board)

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, value)
  board[index] = value
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == nil
    taken = false
elsif board[index] == "X" || board[index] == "O"
  taken = true
elsif board[index] == "" || board[index] == false
  taken = false
end
end

def valid_move?(board,index)
  if index.between?(0,8) && !(position_taken?(board,index))
    return true
  else
    false
  end
end

def turn_count(board)
  turn = 0
  board.each do |index|
    if index == "X" || index == "O"
      turn += 1
    end
  end
  return turn
end

def current_player(board)
turns = turn_count(board)
if turns % 2 == 0
  return "X"
else
  return "O"
end
end

def turn(board)
  puts "Please enter 1-9:"
  num = gets.chomp
  index = input_to_index(num)
  if valid_move?(board, index) == true
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end
