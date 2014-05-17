class LikeIdea < ActiveRecord::Base
  belongs_to :idea, counter_cache: true

  validates :user_id, presence: true
  validates :idea_id, presence: true
end
