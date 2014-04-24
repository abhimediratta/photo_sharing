class Photo < ActiveRecord::Base
	belongs_to :user
  attr_accessible :caption, :photo_url, :user_id
end
