class Song < ActiveRecord::Base
belongs_to :artist
has_many :song_genres
has_many :genres, :through => :song_genres



  def song_attributes=(song_attributes)
    artist = Artist.find_or_create_by(name: song_attributes[:artist_name])
    genre = Genre.find_by(id: song_attributes[:genre_id])
    self.name = song_attributes[:song_name]
    self.genres << genre
    self.artist = artist
    self
  end

def slug
  name.downcase.gsub(" ","-")
end

def self.find_by_slug(slug)
  Song.all.find do |x|
    x.slug == slug
    end
  end



end
