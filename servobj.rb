class MoveMaker
    attr_accessor :human

    def initialize(human, game)
      @human = human
    end

    def self.welcome
      puts "Welcome to tic-tac-toe! Please enter your name."
      name = gets.chomp
      puts "Hello #{name}! You're playing as X."
      @human = Human.new(name, 'X')
      @human.add_game(@game) #adding game to the player's profile
      @computer = Computer.new('O')
      @game = Game.new(@human, @computer)
    end

    def self.start
      puts "Below is your game board."
      @game.printBoard
      puts "It's your turn."
    end

    def self.play

      @game.makeMove
      until @game.checkWinner == true || @game.draw == true
        @game.makeMove
      end
    end

end
