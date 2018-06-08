class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def initialize(name = '',artistName = '')
    @name = name 
    @artist_name = artistName
  end 
    
  def self.create
    song = self.new 
    @@all << song
    return song 
  end 
  
  def self.new_by_name(name)
    song = self.new 
    song.name = name 
    return song 
  end 
  
  def self.create_by_name(name) 
    song = self.new(name) #song = self.new  
    song.name = name # or song = self.new(name)
    @@all << song 
    return song  
  end 
  
  def self.find_by_name(name)
    @@all.find do |songName|
      songName.name == name 
    end 
  end 
  
  def self.find_or_create_by_name(name)
    create_by_name(name) if !find_by_name(name)
    find_by_name(name) if find_by_name(name)
  end 
  
  def self.alphabetical
    @@all.sort_by do |a| 
      a.name.downcase 
    end 
  end 
  
  def self.new_from_filename(filename) 
    format_filename = filename.gsub(".mp3", "").split(" - ")
    song = self.new(format_filename[1], format_filename[0])
    return song 
  end 
  
  def self.create_from_filename(filename)
    format_filename = filename.gsub(".mp3", "").split(" - ")
    song = self.new(format_filename[1], format_filename[0])
    @@all << song 
    return song 
  end 
 
  def self.destroy_all
    @@all.clear 
  end 

end
