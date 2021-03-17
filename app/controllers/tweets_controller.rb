class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_q, only: [:index, :search]
  before_action :find, only: [:show, :edit, :update, :destroy, :move_to_index]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @tweets = Tweet.all.order(created_at: :desc)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  def edit
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to tweet_path
    else
      render :edit
    end
  end

  def destroy
    if @tweet.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def search
    @results = @q.result
  end

  private

  def set_q
    @q = Tweet.ransack(params[:q])
  end


  def tweet_params
    params.require(:tweet).permit(:title, :text, :area_id, :category_id, :status_id, :image).merge(user_id: current_user.id)
  end

  def find
    @tweet = Tweet.find(params[:id])
  end

  def move_to_index
    if current_user.id != @tweet.user.id
      redirect_to action: :index
    end
  end

end
