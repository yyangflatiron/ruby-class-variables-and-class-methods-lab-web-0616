
require_relative './tictactoe.rb'
require_relative './players.rb'
require_relative './servobj.rb'

class Runner
  MoveMaker.welcome
  MoveMaker.start
  MoveMaker.play
end


  # humanMarker = 'X'
  # compMarker ='O'
  # puts "Hello #{name}! Please choose X or O."
  # symbols = ['X','O']
  # humanMarker = gets.chomp
  # compMarker = symbols - humanMarker.split
  # compMarker = compMarker.join


  #Game.new(@human, @computer).playAgain#(@human, @computer)
