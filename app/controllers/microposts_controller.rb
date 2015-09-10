class MicropostsController < ApplicationController
    before_action :logged_in_user, only: [:create]
    
    def create
      @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc).page( params[:page]).per(10)
      @micropost = current_user.microposts.build(micropost_params)
      if @micropost.save
        flash[:success] = "Micropost created!"
        redirect_to root_url
      else
        render 'static_pages/home'
      end
    end
    
    def retweet
      @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc).page( params[:page]).per(10)
      @micropost = current_user.microposts.build(micropost_params)
      if @micropost.save
        flash[:success] = "Micropost created!"
        redirect_to root_url
      else
        render 'static_pages/home'
      end
    end
    
    def destroy
      @micropost = current_user.microposts.find_by(id: params[:id])
      return redirect_to root_url if @micropost.nil?
      @micropost.destroy
      flash[:success] = "Micropost deleted"
      redirect_to request.referrer || root_url
    end
    
    private
    def micropost_params
      params.require(:micropost).permit(:content, :image, :retweet_from_id)
    end
    
end
