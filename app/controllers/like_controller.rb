class LikeController < ApplicationController
  def idea
    idea = Idea.find(params[:id])
    LikeIdea.create!(idea_id: idea.id, user_id: current_user.id)
    render nothing: true
  end

  def comment
    comment = Comment.find(params[:id])
    LikeComment.create!(comment_id: comment.id, user_id: current_user.id)
    render nothing: true
  end
end
