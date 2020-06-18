class Genre 
  attr_accessor :name 
  
  extend Concerns::Findable
  include Concerns::Creatable::InstanceMethods
  
  @@all = []
  
  def initialize(name)
    self.name = name 
  end
  
  # def save
  #   @@all << self
  # end 
  
  # def self.create(name)
  #   self.new(name).tap { |obj| obj.save }
  # end 
  
  def self.all
    @@all
  end
  
  # def self.destroy_all
  #   @@all.clear
  # end 
  
  def genres 
    self.songs.map { |song| songs.genre }.uniq 
  end 
  
end  