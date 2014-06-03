class Comment < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user
  belongs_to :entry
  validates :user_id, presence: true
  validates :entry_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  default_scope order: 'comments.created_at DESC'
end
