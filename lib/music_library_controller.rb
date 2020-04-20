class MusicLibraryController

  def initialize(path = "./db/mp3s")
    @path
    MusicImporter.new(path).import
  end

  def call

    user_input = ""

    while user_input != 'exit'
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      user_input = gets.strip

      case user_input
      when 'list songs'
        self.list_songs
      when 'list artists'
        self.list_artists
      when 'list genres'
        self.list_genres
      when 'list artists'
        self.list_artists
      when 'list artist'
        self.list_songs_by_artist
      when 'list genre'
        self.list_songs_by_genre
      when 'play song'
        self.play_song
      else
        "Type in a valid request please"
      end
    end
  end

  def list_songs
    song_list = Song.all.sort_by {|song| song.name}.uniq
    song_list.each_with_index do |song, i|
      puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort{|a,b| a.name <=> b.name}.each_with_index{|a,i| puts "#{i+1}. #{a.name}"}
  end

end
