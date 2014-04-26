class SharedAlbum < ActiveRecord::Base
	include Obfuscate
	belongs_to :user
  attr_accessible :user_id
  validates_uniqueness_of :user_id
  def to_param
    encrypt id
  end
end
