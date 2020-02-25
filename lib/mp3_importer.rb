class MP3Importer
  
  attr_accessor :path
  
  def initialize(file_path)
    @path =file_path
  end
  
  def files
    # Dir.entries(path) to get the name of all files/directory
    # File.direcotory(name) to check if name is a directory of not (if not, name is a file)
    @files ||= Dir.entries(@path).select {|song| !File.directory?(song) && song.end_with?(".mp3")}
  end

  def import
    files.each {|song| Song.new_by_filename(song)}
  end
  
end