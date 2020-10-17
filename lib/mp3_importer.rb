require'pry'
class MP3Importer
# will parse all the filenames in the spec/fixtures folder and send the filenames to the Song class
attr_accessor :path

    def initialize(path) #accepts a file path to be parsed
        @path = path
    end

    def files #follow path directory and load all mp3 files then normalize the filenames with no path.
        files ||= Dir.entries(@path).select { |song| !File.directory?(song) && song.end_with?(".mp3") }
    end

    def import 
        self.files.each do |file| Song.new_by_filename(file)
        end
    end
    

end
