class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    array = Dir.glod(self.path + "*.mp3")
    array.map do |file|
      file.gsub(self.path + "/", "").gsub(".mp3", "")
     end
  end

  def import
    files.each{ |f| Song.create_from_filename(f) }
  end
end