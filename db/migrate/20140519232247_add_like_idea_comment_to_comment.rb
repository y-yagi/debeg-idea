class AddLikeIdeaCommentToComment < ActiveRecord::Migration
  def change
    add_column :comments, :like_comments_count, :integer, default: 0
  end
end
