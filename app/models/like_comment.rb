class LikeComment < ActiveRecord::Base
  belongs_to :comment, counter_cache: true

  validates :user_id, presence: true
  validates :comment_id, presence: true
end
