class Song

@@all= []
@@count = 0
@@genres = []
@@artists = []
#@@artistsNum = {}

attr_accessor :name, :artist, :genre

  def initialize(name,artist,genre)
    @name = name
    @artist = artist
    @genre = genre
    @@count += 1
    @@artists << artist
    @@genres << genre

  end

  def self.count
    @@count
  end

  def self.artists
    @@artists.uniq

  end

  def self.genres
    @@genres.uniq
  end

  def self.genre_count
    @@genres.each_with_object({}) do |gr, genreHash|
      genreHash[gr] = @@genres.count(gr)
    end 
  end

  def self.artist_count
    @@artists.each_with_object({}) do |artist, artistHash|
      artistHash[artist] = @@artists.count(artist)
    end
  end


end
