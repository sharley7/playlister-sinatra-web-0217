class AddArtistToGenres < ActiveRecord::Migration
  def change
    add_column :genres, :artist_id, :string
  end
end
