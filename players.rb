
class Human
  attr_accessor :humanName, :humanMarker
  def initialize (name, marker)
    @name = name
    @marker = marker
    @allGamesPlayed = []
  end

  def add_game(game) #adding each game to the player's profile
    @allGamesPlayed << game
    #game.player = self #game knows who its player is
  end

  def games #calling all games that the player played
    @allGamesPlayed
  end
end


class Computer
  attr_accessor :compMarker
  def initialize (marker)
    @marker = marker
  end
end
