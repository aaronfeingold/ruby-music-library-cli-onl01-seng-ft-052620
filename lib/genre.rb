class Genre 
  attr_accessor :name 
  attr_reader :songs 
  
  extend Concerns::Findable
  extend Concerns::Creatable::ClassMethods
  
  include Concerns::Creatable::InstanceMethods
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def artists
    songs.collect{ |s| s.artist }.uniq
  end
  

end  