class Genre 
  attr_accessor :name 
  
  extend Concerns::Findable
  extend Concerns::Creatable::ClassMethods
  
  include Concerns::Creatable::InstanceMethods
  
  @@all = []
  
  def initialize(name)
    self.name = name 
    self.songs = []
  end
  
  def self.all
    @@all
  end
  
  def genres 
    self.songs.map { |song| songs.genre }.uniq 
  end 
  
  # def save
  #   @@all << self
  # end 
  
  # def self.create(name)
  #   self.new(name).tap { |obj| obj.save }
  # end 
  
  # def self.destroy_all
  #   @@all.clear
  # end 
end  