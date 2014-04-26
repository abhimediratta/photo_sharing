class AddUniqueIndexToAlbum < ActiveRecord::Migration
  def change
  	remove_index :shared_albums,:user_id
  	add_index :shared_albums, :user_id, :unique => true
  end
end
