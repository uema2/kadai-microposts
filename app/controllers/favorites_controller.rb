class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    likes = Micropost.find(params[:micropost_id])
    current_user.like(likes)
    flash[:success] = "お気に入りしました。"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    likes = Micropost.find(params[:micropost_id])
    current_user.unlike(likes)
    flash[:success] = "お気に入りを解除しました。"
    redirect_back(fallback_location: root_path)
  end
end
