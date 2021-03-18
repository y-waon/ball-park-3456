require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
    @user =FactoryBot.create(:user)
  end
  describe "新規ツイート" do
    context '新規ツイートできるとき' do
      it "一連のツイート" do
        @tweet.user = @user
        expect(@tweet).to be_valid
      end
    end
    context '新規ツイートできない時' do
      it 'ツイート画像を1枚つけることが必須であること' do
        @tweet.image = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Imageを入力してください")
      end
      it 'ツイートタイトルが必須であるということ' do
        @tweet.title = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Titleを入力してください")
      end
      it 'ツイートの説明が必要だということ' do
        @tweet.text = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Textを入力してください")
      end
      it 'カテゴリーの情報の記入が必要だということ' do
        @tweet.category_id = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Categoryは数値で入力してください")
      end
      it 'カテゴリーの情報の記入が必要だということ(1代入)' do
        @tweet.category_id = 1
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Categoryは1以外の値にしてください")
      end
      it 'エリア情報が必要だということ' do
        @tweet.area_id = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Areaは数値で入力してください")
      end
      it 'エリア情報が必要だということ(1代入)' do
        @tweet.area_id = 1
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Areaは1以外の値にしてください")
      end
      it 'ステータス情報が必要だということ' do
        @tweet.status_id = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Statusは数値で入力してください")
      end
      it 'ステータス情報が必要だということ(1代入)' do
        @tweet.status_id = 1
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Statusは1以外の値にしてください")
      end
    end
  end
end
