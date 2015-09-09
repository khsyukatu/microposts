class RetweetsController < ApplicationController
  before_action :logged_in_user
  
  def create
    @micropost = Micropost.find(params[:id])
    current_user.retweet(@micropost)
  end
  
  def destroy
    @micropost = current_user.retweet_relationships.find(pramas[:id]).retweet_post
    current_user.destroy_retweet(@micropost)
  end
  
end
