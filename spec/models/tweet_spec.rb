require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
  end
  describe "新規ツイート" do
    context '新規ツイートできるとき' do
      it "一連のツイート" do
        expect(@tweet).to be_valid
      end
    end
    context '新規ツイートできない時' do
      it 'ツイート画像を1枚つけることが必須であること' do
        @tweet.image = nil
        @tweet.valid?
        binding.pry
      end
      it 'ツイートタイトルが必須であるということ' do
      end
      it 'ツイートの説明が必要だということ' do
      end
      it 'カテゴリーの情報の記入が必要だということ' do
      end
      it 'カテゴリーの情報の記入が必要だということ(1代入)' do
      end
      it 'エリア情報が必要だということ' do
      end
      it 'エリア情報が必要だということ(1代入)' do
      end
      it 'ステータス情報が必要だということ' do
      end
      it 'ステータス情報が必要だということ(1代入)' do
      end
    end
  end
end
