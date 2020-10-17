class Artist #artist has_many songs
# responsible for either creating the artist (if the artist doesn't yet exist in the program yet)
# or responsible for finding the instance of that artist (if the artist does already exist in the program)
    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        @@all << self
    end

    def songs #lists all songs that belong to this artist
        Song.all.select { |song| song.artist == (self) }
    end

    def add_song(song) #tell a passed in song that it belongs to this artist instance
        song.artist = self
    end

    def self.all #this will read class variable @@all
        @@all
    end
  
    def self.find_or_create_by_name(name)
        if self.find(name)
            self.find(name)
        else
            self.create(name)
        end
    end

    def self.find(name)
        @@all.find do |artist|
            artist.name == name
        end
    end

    def self.create(name)
        artist = self.new(name)
        artist
    end

    def print_songs #prints out array of song names
       all_songs_array = []
       Song.all.each { |song_instance| 
            if song_instance.artist == self
                all_songs_array << song_instance.name 
            else
            end
            }
        puts all_songs_array
    end

end


#MP3 relies on song in order to parse the filenames
#Song relies on Artist instances to build associations
