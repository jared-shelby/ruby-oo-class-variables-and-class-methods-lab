class Song
    # store count of songs
    @@count = 0

    # store genres
    @@genres = []

    # store artists
    @@artists = []
    
    # be able to read/write each song's name, artist, genre
    attr_accessor :name, :artist, :genre
    
    # initialize each song with its info, increment Song count, add genre to Song genres
    def initialize(name, artist, genre)
        @name = name
        @artist = artist
        @genre = genre
        @@count += 1
        @@genres << genre
        @@artists << artist
    end

    # return total num of songs added
    def self.count
        @@count
    end

    # return array of all genres
    def self.genres
        @@genres.uniq
    end

    # return array of all artists
    def self.artists
        @@artists.uniq
    end

    # return hash of genres & their counts
    def self.genre_count
        # One liner from online: Hash[*@@genres.group_by{ |v| v }.flat_map{ |k, v| [k, v.size] }]
        # My way:
        genre_hash = {}
        @@genres.each { |genre| genre_hash.include?(genre) ? genre_hash[genre]+= 1 : genre_hash[genre] = 1 }
        genre_hash
    end

    # return hash of artists & their counts
    def self.artist_count
        artist_hash = {}
        @@artists.each { |artist| artist_hash.include?(artist) ? artist_hash[artist] += 1 : artist_hash[artist] = 1 }
        artist_hash
    end

end