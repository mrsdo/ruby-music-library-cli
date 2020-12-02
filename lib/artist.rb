# frozen_string_literal: true

require 'pry'

# Author: Martinique Dolce
# Course: Flatiron School 2020, November 9 - 20201, April 2021
# Contact: me@martidolce.com | https://modis.martidolce.com
# artist.rb
class Artist
  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @artist = artist
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create(artist_name)
    song = Song.new(artist_name)
    song.artist_name = self
    song
  end

  def add_song(song)
    song.artist = self
  end

  def add_song_by_name(name)
    song = Song.new(name)
    song.artist = self
    song
  end

  def songs
    Song.all.select { |song| song.artist == self }
  end

  def self.song_count
    Song.all.count
  end

  def self.destroy_all
    all.clear
  end
end
