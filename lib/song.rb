require "pry"

class Song
  attr_accessor :artist_name, :name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    files = filename.split(/[-.]/)
    artist = files[0].strip
    song_name = files[1].strip

    song = Song.new
    song.artist_name = artist
    song.name = song_name
    binding.pry
  end

  def self.create_from_filename
    
  end

  def self.destroy_all
    self.all.clear
  end

end
