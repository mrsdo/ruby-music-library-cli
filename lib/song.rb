# frozen_string_literal: true

require 'pry'
# Author: Martinique Dolce
# Course: Flatiron School 2020, November 9 - 20201, April 2021
# Contact: me@martidolce.com | https://modis.martidolce.com
#
# song.rb
class Song
  attr_accessor :name, :artist_name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = new(name)
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = create(name)
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    all.find { |song| song.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    find_by_name(song_name) || create_by_name(song_name)
  end

  def self.alphabetical
    all.sort_by(&:name)
  end

  def self.new_from_filename(filename)
    parts = filename.split(' - ')
    artist_name = parts[0]
    song_name = parts[1].gsub('.mp3', '')

    song = new(name)
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    parts = filename.split(' - ')
    artist_name = parts[0]
    song_name = parts[1].gsub('.mp3', '')

    song = create(name)
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    all.clear
  end
end
