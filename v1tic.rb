require 'pry'
class Board

attr_accessor :playerName, :winningCombos, :turns
  @@board = [1,2,3,4,5,6,7,8,9]
#@@winningCombos = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  @turns = 0

  def initialize(human, computer)
    puts "Welcome to tic-tac-toe! Please enter your name."
    playerName = gets.chomp
    puts "Hello #{playerName}! Below is your game board."
    displayBoard
    Player.promptUser
    takeTurns
  end

  def self.turns
    return @turns
  end

  def self.turns=(turns)

  end

  def turns=(turns)
    @turns = turns
  end

  def takeTurns
    if turns.odd?
      Computer.compMove
    elsif @turns.even?
      Player.playerMove
    elsif @turns > 9
      puts "It's a draw!"
    end
    displayBoard
    checkWinner
  end



  def displayBoard
    puts "    -------------
    | #{@@board[0]} | #{@@board[1]} | #{@@board[2]} |
    |-----------|
    | #{@@board[3]} | #{@@board[4]} | #{@@board[5]} |
    |-----------|
    | #{@@board[6]} | #{@@board[7]} | #{@@board[8]} |
    -------------"
  end

  def checkWinner
    @@winningCombos.each do |combo|
      if 
        (@@board[0] == @@board[3] && @@board[3] == @@board[6]) ||
        (@@board[1] == @@board[4] && @@board[4] == @@board[7]) ||
        (@@board[2] == @@board[5] && @@board[5] == @@board[8]) ||
        (@@board[0] == @@board[1] && @@board[1] == @@board[2]) ||
        (@@board[3] == @@board[4] && @@board[4] == @@board[5]) ||
        (@@board[2] == @@board[5] && @@board[5] == @@board[8]) ||
        (@@board[0] == @@board[4] && @@board[4] == @@board[8]) ||
        (@@board[2] == @@board[4] && @@board[4] == @@board[6]) 

      #original code that did not work: Player.allPlayerMoves.sort == combo #(Player.allPlayerMoves.include?(combo[0]) && Player.allPlayerMoves.include?(combo[1]) && Player.allPlayerMoves.include?(combo[2]))
        puts "You've won!"

        break
      else
        takeTurns
     end
    end

  end

  def self.newBoard
    @@board
  end

end




class Player
@@allPlayerMoves = []
attr_accessor :userMove, :userResponse

  def initialize
    @@userResponse = "blank"
    promptUser



  end

  def self.promptUser
    puts "Please choose X or O"
    @@userResponse = gets.chomp
    while @@userResponse != "X" and @@userResponse != "O" 
      puts "Please enter only X or O"
      @@userResponse = gets.chomp
    end


  end

  def self.playerMove
    puts "Please select your move from the square number."
    @@userMove = 0
    @@userMove = gets.chomp.to_i
    unless Board.newBoard.include?(@@userMove)
      @@userMove = gets.chomp.to_i
      puts "Please try again in the available slots."
    end
    @@allPlayerMoves << @@userMove
    Board.newBoard[@@userMove-1] = @@userResponse
    binding.pry

    Board.turns += 1
  end

  def self.allPlayerMoves
    @@allPlayerMoves
  end
  #def playerMove

end

class Computer
  @@samples = []
  @@allCompMoves = []
  def self.compMove
    @@board.each do |x|
      if x.is_a? Integer
        @@samples << x
        @@allCompMoves = @@samples.sample

      end
    end
    Board.turns += 1
  end

end



Pry.start
