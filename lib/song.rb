class Song

@@all= []
@@count = 0
@@genre = []
@@artists = []
@@genreNum  
@@artistsNum = {}
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
    @@genre.each_with_object({}) do |genre, num|
      @@num[genre] << genre.count 
    end



    #@@genre.each do |genre|
      #populate with key value pairs
  end

  def self.artist_count
  end

  def self.count

  end
end