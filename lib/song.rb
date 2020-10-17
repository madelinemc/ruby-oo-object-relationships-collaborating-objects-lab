class Song
# responsible for creating songs given each filename
# responsible for sending the artist's name which is a string to the Artist class
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @artist = artist
        @@all << self
    end

    def self.new_by_filename(file)
        song_name = file.split(" - ")[1] # 1. parse filename to find song name and artist name. separated by " - "
        artist_name = file.split(" - ")[0]
        new_song = self.new(song_name) # 2. create new song instance using the string gathered from step 1
        new_song.artist_name=(artist_name)# 3. associate that new song with an artist.
        new_song #4. return the song instance
    end

    def artist_name=(name)
        new_artist = Artist.find_or_create_by_name(name)
        new_artist.add_song(self)
    end

    def self.all #this will read class variable @@all
        @@all
    end
    
end
