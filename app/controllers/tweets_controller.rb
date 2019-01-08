class TweetsController < ApplicationController

  # before_action :move_to_index, except: :index

  # before_action :move_to_index, except: [:index, :show]

  # before_action :move_to_index, except: :index

    # indexアクションが実行される時以外に、hogeが実行される。

  def index
    @tweets = Tweet.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
  end

  def create
    Tweet.create(image: tweet_params[:image], text: tweet_params[:text], user_id: current_user.id)
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy if tweet.user_id == current_user.id
    # end
  end

  def edit
  @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.update(tweet_params)
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments.includes(:user)
  end

  private
  def tweet_params
    params.permit(:image, :text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
  # class TweetsController < ApplicationController

    # before_action :move_to_index, except: :index

    # def index
      # @tweets = Tweet.all
      # 最新のツイートが一番上に並び替え
      # @tweets = Tweet.all.order("created_at DESC")
      # allを省略
      # @tweets = Tweet.order("created_at DESC")
      # @tweets = Tweet.order("created_at DESC").page(params[:page]).per(5)

      # @tweets = Tweet.includes(:user).page(params[:page]).per(5).order("created_at DESC")
    # end

    # def new
    # end

    # def create
      # Tweet.create(tweet_params)
      # binding.pry バイディングプライ 処理を止める
      # Tweet.create(name: tweet_params[:name], image: tweet_params[:image], text: tweet_params[:text], user_id: current_user.id)
      # Tweet.create(image: tweet_params[:image], text: tweet_params[:text], user_id: current_user.id)
    # end

    # private
    # def tweet_params
      # params.permit(:name, :image, :text)
      # params.permit(:image, :text)
    # end

    # def move_to_index
      # redirect_to action: :index unless user_signed_in?
    # end

  # end
