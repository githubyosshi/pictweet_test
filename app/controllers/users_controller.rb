class UsersController < ApplicationController
# マイページに表示したい情報をshowアクションに定義
  def show
# binding.pry
    user = User.find(params[:id])
    @nickname = current_user.nickname
      # @tweets = Tweet.where(user_id: current_user.id).page(params[:page]).per(5).order("created_at DESC")
    @tweets = user.tweets.page(params[:page]).per(5).order("created_at DESC")
    # @tweets = current_user.tweets.page(params[:page]).per(5).order("created_at DESC")
  end
end
