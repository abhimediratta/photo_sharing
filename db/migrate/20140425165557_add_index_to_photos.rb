class AddIndexToPhotos < ActiveRecord::Migration
  def up
  	add_index :photos, :user_id
  end
end
