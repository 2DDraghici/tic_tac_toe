class TicTacToe
  def initialize
    puts 'Hello and welcome to a new game of Tic-Tac-Toe'
    puts "PLAYER 1 , what's your name?"
    @player1 = gets.chomp
    puts "PLAYER 2 , what's your name?"
    @player2 = gets.chomp
    @winner = false
    @board = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]
    display_board
    @turn = rand(1..2)
  end
private
  def display_board
    @board.each do |row|
      row.each do |element|
        print element
        print ' '
      end
      puts
    end
  end

  private

  def replace_value( value, sign)
    array = @board.flatten
    array[value - 1] = sign
    y = []
    array.each_slice(3) { |tuple| y.push(tuple) }
    @board = y
    
  end
  private
  def check_winner(board)
    board.each do |row| #  check the lines
      return true if row[0] == row[1] && row[0] == row[2]
      
    end
    columns = board.transpose
    columns.each do |row| #  check the columns
      return true if row[0] == row[1] && row[0] == row[2]
    end
    diagonals = board.flatten #  check diagonals
    return true if diagonals[0] == diagonals[4] && diagonals[0] == diagonals[8]

    return true if diagonals[2] == diagonals[4] && diagonals[0] == diagonals[6]
    return false
  end
private
  def player_move(number)
    puts "What is your move player #{number}?"
    move =gets.chomp
    move = move.to_i
    move
  end

  public

  def play_game
    iswinner = false
    
    while @winner == false
      if @turn == 1
        player_choice = player_move(1)
        replace_value( player_choice, "X")
        display_board
        iswinner = check_winner(@board)
        puts 'Player #1 has won!' if iswinner == true
        @winner = check_winner(@board)
        @turn = 2
        
      end
      if @turn == 2
        player_choice = player_move(2)
        replace_value( player_choice, "O")
        display_board
        iswinner = check_winner(@board)
        puts 'Player #2 has won!' if iswinner == true
        @winner = check_winner(@board)
        @turn = 1
        
      end
    end
  end
end
game = TicTacToe.new()
game.play_game
