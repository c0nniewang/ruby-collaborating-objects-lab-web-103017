require 'pry'

class Artist
  @@all = []
  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.find_or_create_by_name(name)
    if @@all.find {|a| a.name == name} == nil
      new_artist = Artist.new(name)
      new_artist.save
      return new_artist
    else
      @@all.detect {|a| a.name == name}
    end
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def print_songs
    @songs.map {|song| puts song.name }
  end

end