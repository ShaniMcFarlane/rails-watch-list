class AddMovieReferenceToBookmarks < ActiveRecord::Migration[7.2]
  def change
    add_reference :bookmarks, :movie, null: false, foreign_key: true
  end
end
