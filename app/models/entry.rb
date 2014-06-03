class Entry < ActiveRecord::Base
  attr_accessible :title, :content
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 140 }
  validates :content, presence: true, length: { maximum: 1400 }
  has_many  :comments, dependent: :destroy 

  default_scope order: 'entries.created_at DESC'

  def self.from_users_followed_by(user)
  	followed_user_ids = user.followed_user_ids
  	where("user_id IN (:followed_user_ids) OR user_id = :user_id", followed_user_ids: followed_user_ids, user_id: user)
  end

=begin
  def self.from_users_followed_by(user)
	followed_user_ids = "SELECT followed_id FROM relationships WHERE follower_id = :user_id"
	where("user id IN (#{followed_user_ids}) OR user_id = :user_id",
	user_id: user.id)
  end
=end
end
