class FavoriteMicropostsController < ApplicationController
  before_action :require_user_logged_in

  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.like(micropost)
    flash[:success] = 'マイクロポストをお気に入りしました。'
    redirect_to microposts_path
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.dislike(micropost)
    flash[:success] = 'マイクロポストのお気に入りを解除しました。'
    redirect_to microposts_path
  end
end
