class Artist 
  
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name
    save
  end
  
  def save 
    @@all << self
  end
  
  def self.all 
    @@all
  end
  
  def add_song(song)
    song.artist = self
  end
  
  def songs 
    Song.all.select {|song| song.artist == self}
  end
  
  def self.find_or_create_by_name(name)
    
    # if @@all.include?(name) 
    #   # index = @@all.index(name)
    #   # @@all[index]
    #   new_artist = @@all.find {|artist| artist.name == name}
    # else 
    #   self.new(name)
    # end
    
    find = @@all.find{|song| song.name == name}
    if !find 
      self.new(name)
    else 
      find
    end
    
   
  end
  
  def print_songs
   Song.all.collect do |song|
     if song.artist == self
       puts "#{song.name}"
     end
   end
  end
  
end