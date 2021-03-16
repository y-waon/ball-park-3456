class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @tweets = Tweet.all.order(created_at: :desc)
  end
end
