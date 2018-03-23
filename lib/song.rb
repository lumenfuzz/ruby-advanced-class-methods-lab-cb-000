class Song
  attr_accessor :name, :artist_name
  @@all = []

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

  def self.new_from_filename(filename)
    song = self.new
    file_data = filename.split(" - ")
    song.name = file_data[1]
    file_data[0] = file_data[0].scan(/[^.]+/)
    song.artist_name = file_data[0]
    return song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    return song
  end

  def self.find_by_name(name)
    @@all.each do |song|
      return song if song.name == name
    end
    return nil
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    return song if song != nil
    return self.create_by_name(name) if song == nil
  end

  def self.alphabetical
    name_array = []
    @@all.each do |song|
      name_array << song.name
    end
    name_array.sort!
    song_array = []
    name_array.each do |name|
      song_array << self.find_by_name(name)
    end
    return song_array
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
