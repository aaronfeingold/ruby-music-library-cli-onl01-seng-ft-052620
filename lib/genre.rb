class Genre 
  attr_accessor :name 
  attr_reader
  
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
  
  def genres 
    self.songs.map { |song| songs.genre }.uniq 
  end 
  

end  