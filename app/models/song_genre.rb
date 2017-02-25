class SongGenre < ActiveRecord::Base
  belongs_to :genre
  belongs_to :song

  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    SongGenre.all.find do |x|
      x.slug == slug
      end
    end

end
