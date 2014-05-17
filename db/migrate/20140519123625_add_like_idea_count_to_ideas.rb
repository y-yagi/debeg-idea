class AddLikeIdeaCountToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :like_ideas_count, :integer, default: 0
  end
end
