class AddListReferenceToBookmarks < ActiveRecord::Migration[7.2]
  def change
    add_reference :bookmarks, :list, null: false, foreign_key: true
  end
end
