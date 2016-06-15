

class Game
  attr_accessor :currentPlayer, :allHumanMoves, :allCompMoves, :currentHumanMove, :board, :currentCompMove, :sampling

  def initialize (human, computer)
    @currentPlayer = 1
    @allHumanMoves = []
    @allCompMoves =[]
    @currentHumanMove = 0
    @currentCompMove = 0
    @sampling = []
    @board = [1,2,3,4,5,6,7,8,9]
  end

  def printBoard
    puts "    -------------
    | #{@board[0]} | #{@board[1]} | #{@board[2]} |
    |-----------|
    | #{@board[3]} | #{@board[4]} | #{@board[5]} |
    |-----------|
    | #{@board[6]} | #{@board[7]} | #{@board[8]} |
    -------------"
  end

  def updateBoard

    board[currentHumanMove.to_i-1] = 'X'
    if currentCompMove!=0
      board[currentCompMove.to_i-1 ] = 'O'
    end
    printBoard
  end

  def makeMove
    if @currentPlayer.odd?
      humanMoves
    elsif @currentPlayer.even?
      compMoves
    end
  end

  def humanMoves
     puts "Make a move!"
      @currentHumanMove = gets.chomp.to_i
      until @board.include?(@currentHumanMove)
        puts "Enter a valid number in the remaining positions!"
        @currentHumanMove = gets.chomp.to_i
      end
      @currentPlayer += 1
      updateBoard
  end

  def compMoves
    puts "Computer is making a move."
      @sampling = @board.select do |slot|
        slot.is_a? Integer
      end
      @currentCompMove = @sampling.sample
      updateBoard
      @currentPlayer += 1
  end

  def checkWinner
    if
      winningCombos
      if @currentPlayer.odd?
        puts "You lost!"
      elsif @currentPlayer.even?
        puts "You win!"
      end
      true
    else
      false
    end
  end



  def winningCombos
    if
      (@board[0] == @board[3] && @board[3] == @board[6]) ||
      (@board[1] == @board[4] && @board[4] == @board[7]) ||
      (@board[2] == @board[5] && @board[5] == @board[8]) ||
      (@board[0] == @board[1] && @board[1] == @board[2]) ||
      (@board[3] == @board[4] && @board[4] == @board[5]) ||
      (@board[2] == @board[5] && @board[5] == @board[8]) ||
      (@board[0] == @board[4] && @board[4] == @board[8]) ||
      (@board[2] == @board[4] && @board[4] == @board[6])
      return true
    else
      return false
    end
  end



  def draw
    if
      @currentPlayer == 10
      puts "It's a draw!"
      #playAgain
    end
  end

  # def playAgain#(human, computer)
  #   puts "Want to play again? Enter YES for a new game!"
  #   ask = gets.chomp
  #   if ask == 'YES'
  #     game2 = Game.new('old player', 'X')
  #     game2.@board = [1,2,3,4,5,6,7,8,9]
  #   else
  #     puts "Thanks for playing!"
  #   end
  # end

end
