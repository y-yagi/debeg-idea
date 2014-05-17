class Idea < ActiveRecord::Base
  has_many :comments
  has_many :like_ideas
  has_many :like_comments, through: :comments
  belongs_to :user

  validates :title, length: { maximum: 100 }, presence: true
end
