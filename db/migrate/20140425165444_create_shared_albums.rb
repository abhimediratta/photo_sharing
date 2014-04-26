class CreateSharedAlbums < ActiveRecord::Migration
  def change
    create_table :shared_albums do |t|
      t.integer :user_id

      t.timestamps
    end
    add_index :shared_albums, :user_id
  end
end
