class Song

@@all= []
@@count = 0
@@genres = []
@@artists = []
@@genreNum
@@artistsNum = {}
attr_accessor :name, :artist, :genre, :genres

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

  def self.genre_count(genres)
    genreHash = {}
    @@genres.each_with_object({}) do |genre, genreHash|
      if genreHash.keys.include?(:genre)
        genreHash[:genre] += 1
      else
        genreHash[:genre] = 1
      end
    genreHash
    #@@genre.each do |genre|
      #populate with key value pairs
  end

  def self.artist_count
  end


end
