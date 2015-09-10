class FavRelationshipsController < ApplicationController
    before_action :logged_in_user
  
  def create
    @micropost = Micropost.find(params[:fav_tweet_id])
    current_user.fav_tweet(@micropost)
    flash[:success] = "お気に入りに追加しました!"
    redirect_to root_url
  end
  
  def destroy
   @micropost = Micropost.find(params[:fav_tweet_id])
   current_user.remove_fav_tweet(@micropost)
   flash[:success] = "お気に入りから削除しました"
   redirect_to root_url
  end
end
