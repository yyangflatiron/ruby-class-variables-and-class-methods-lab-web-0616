#require 'Pry'

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
      return true
    else
      return false      
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
  #     Game.new('old player', 'X')
  #     @board = [1,2,3,4,5,6,7,8,9]
  #   else
  #     puts "Thanks for playing!"
  #   end
  # end

end


class Human
  attr_accessor :humanName, :humanMarker
  def initialize (name, marker)
    @name = name
    @marker = marker
  end
end


class Computer 
  attr_accessor :compMarker
  def initialize (marker)
    @marker = marker
  end
end


class Runner

  def self.welcome
    puts "Welcome to tic-tac-toe! Please enter your name."
    name = gets.chomp
    puts "Hello #{name}! You're playing as X."

    @human = Human.new(name, 'X')
    @computer = Computer.new('O')
    @game1 = Game.new(@human, @computer)
    puts "Below is your game board."
  end

  welcome


  # humanMarker = 'X'
  # compMarker ='O'
  # puts "Hello #{name}! Please choose X or O."
  # symbols = ['X','O']
  # humanMarker = gets.chomp
  # compMarker = symbols - humanMarker.split
  # compMarker = compMarker.join 

  @game1.printBoard
  puts "It's your turn."
  @game1.makeMove
  until @game1.checkWinner == true || @game1.draw == true
    @game1.makeMove
  end
  #Game.new(@human, @computer).playAgain#(@human, @computer)
end

#Pry.start