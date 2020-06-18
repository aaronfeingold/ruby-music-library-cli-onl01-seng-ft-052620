class Song
  attr_accessor :name
  attr_reader :artist, :genre 
  
  extend Concerns::Findable
  extend Concerns::Creatable::ClassMethods
  
  include Concerns::Creatable::InstanceMethods
  
  
  @@all = []
  
  def initialize(name, artist=nil, genre=nil )
    self.name = name 
    self.artist = artist if artist 
    self.genre = genre if genre 
  end 
  
  def artist=(artist)
    @artist = artist 
    artist.add_song(self)
  end 
  
  def genre=(genre)
    @genre = genre 
    genre.songs << self unless genre.songs.include?(self)
  end 
  
  def self.all
    @@all 
  end
  
  def self.new_from_filename(file)
    
    artist_name, song_name, genre_name = file.split(" - ")
    
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name.gsub(".mp3", ""))
  
    self.new
  end 
  
  # def save
  #   @@all << self 
  # end 
  
  # def self.create(name)
  #   # initializes
  #   song = Song.new(name)
  #   # saves
  #   song.save 
  #   #and returns the song
  #   song 
  # end 
  
  # def self.destroy_all 
  #   self.all.clear
  # end 
  
  
  
end 