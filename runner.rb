require_relative './tictactoe.rb'

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
