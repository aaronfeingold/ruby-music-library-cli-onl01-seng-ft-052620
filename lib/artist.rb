class Artist 
  attr_accessor :name, :songs 
  
  extend Concerns::Findable
  extend Concerns::Creatable::ClassMethods
  
  include Concerns::Creatable::InstanceMethods
  
  @@all = [] 
  
  def initialize(name)
    self.name = name
    self.songs = []
  end 
  
  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless @songs.include?(song)
  end 
  
  def self.all
    @@all 
  end 

   def genres
    songs.collect{ |s| s.genre }.uniq
  end
  
end 