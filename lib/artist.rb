class Artist 
  attr_accessor :name, :songs 
  
  extend Concerns::Findable
  include Concerns::Creatable::InstanceMethods
  
  
  @@all = [] 
  
  def initialize(name)
    self.name = name
    self.songs = []
  end 
  
  # def save
  #   @@all << self 
  # end 
  
  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless @songs.include?(song)
  end 
  
  def self.all
    @@all 
  end 
  
  def self.destroy_all 
    @@all.clear
  end
  
  def self.create(name)
    self.new(name).tap { |obj| obj.save }
  end 
  
end 