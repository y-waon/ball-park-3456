require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @tweet = FactoryBot.build(:tweet)
  end
  describe "コメント投稿機能" do
    context 'コメント投稿できるとき' do
      @comment.user = @user
      @comment.tweet = @tweet
      expect(@comment).to be_valid
    end
    context 'コメント投稿できるとき' do
    end
  end
end
