class WelcomeController < ApplicationController
  def index
    @idea = Idea.new
    @ideas = Idea.order('created_at desc')
    @already_like_ideas = LikeIdea.where(user_id: session[:user_id]).pluck(:idea_id) if logged_in?
  end
end
