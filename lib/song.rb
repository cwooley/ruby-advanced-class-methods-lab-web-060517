class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def Song.create
    new_song = Song.new
    new_song.save
    new_song
  end

  def Song.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song
  end

  def Song.create_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song.save
    new_song
  end

  def Song.find_by_name(name)
    self.all.find do |song|
      song.name == name
    end
  end

  def Song.find_or_create_by_name(name)
    if self.find_by_name(name)
      created_song = self.find_by_name(name)
    else
      created_song = self.create_by_name(name)
    end
    created_song
  end

  def Song.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def Song.new_from_filename(filename)
    names_array = filename.split(" - ")
    new_song = Song.new
    new_song.artist_name = names_array[0]
    new_song.name = names_array[1].sub('.mp3', '')
    new_song
  end

  def Song.create_from_filename(filename)
    names_array = filename.split(" - ")
    new_song = Song.new
    new_song.artist_name = names_array[0]
    new_song.name = names_array[1].sub('.mp3', '')
    new_song.save
    new_song
  end

  def Song.destroy_all
    @@all = []
  end
end
