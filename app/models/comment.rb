class Comment < ActiveRecord::Base
  belongs_to :idea
  belongs_to :user
  has_many :like_comments

  validates :body, length: { maximum: 1000 }, presence: true
end
