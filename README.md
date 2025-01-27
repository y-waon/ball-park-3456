# README

## アプリケーション名

BALL-SEARCH

## アプリケーションの要件

公園の写真のシェア  
公園名での検索機能  
ログインしているユーザーは投稿に対してのコメントの閲覧と投稿
非ログインユーザーはコメントの閲覧のみできます


## URL

https://ball-park-3456.herokuapp.com/

## 利用方法

新規登録から登録、NEW TWEETから写真付きで投稿する、投稿に対してコメントを行う

## 目指した課題解決

最近だと、公園などでボール遊びが禁止であったりして、子供の外での活動が少なくなっていると感じました。  
また、スポーツ人口も、少子高齢化のあおりもあリますが、徐々にですが、減りつつあリます。  
このことから、まずは身近なところから、運動する場所を見つけてもらおうとこのアプリケーションを作成しました。  

## 実装機能についての説明

## ユーザー新規登録機能、ユーザーログイン機能  

deviseを用いて実装しました。メールアドレス、パスワード、ユーザー名を入力すれば登録できるようになっています。  
また、ログイン機能の方は、メールアドレスとパスワードの入力でログインできます。  
また、エラーメッセージは、日本語の表示になるように、rails-i18nのgemを導入しました。  

 ## ユーザー新規登録画面  

<img width="1440" alt="ポートフォリオ 新規登録画面" src="https://user-images.githubusercontent.com/78067393/111743595-4ad3cd80-88cd-11eb-8a2b-0bfcd44370bb.png">  

 ## 新規ユーザー登録のGIF  

https://user-images.githubusercontent.com/78067393/112083905-40664c00-8bcb-11eb-8bbf-7c22cb643a46.gif  

 ## ユーザーログイン画面  

<img width="1440" alt="ログイン画面" src="https://user-images.githubusercontent.com/78067393/111743840-9c7c5800-88cd-11eb-8ab6-b54c907aa51a.png">  

 ## ユーザーログインのGIF  

https://user-images.githubusercontent.com/78067393/111760840-84fb9a00-88e2-11eb-8b67-05abfdee3257.mp4  

 ## ユーザーログイン  


## 新規ツイート機能  

新規ツイートする際には、全てバリデーションをかけているため、どこかの項目に空だと投稿できないようになっています。  
投稿されたツイートは、トップページに表示されます。  
また、ユーザー新規登録機能、ユーザーログイン機能と同様に、rails-i18nのgemを導入しました。  

## 新規ツイート画面  

<img width="1440" alt="新規ツイート" src="https://user-images.githubusercontent.com/78067393/111744679-efa2da80-88ce-11eb-87d5-d1548e22dcaf.png">  

## ツイートされたものの表示  

<img width="1433" alt="投稿されたツイートの表示" src="https://user-images.githubusercontent.com/78067393/111745870-9176f700-88d0-11eb-9dc6-d2db6b3031ab.png">  

## ツイート削除機能・ツイート編集機能  

ツイートの詳細画面にて投稿したユーザーのみが、編集・削除できます。  

※以下のリンクに画像があります  

https://user-images.githubusercontent.com/78067393/111748030-5a561500-88d3-11eb-9569-1d8348be4270.png  

## 編集画面

<img width="1428" alt="編集画面" src="https://user-images.githubusercontent.com/78067393/111761774-9e511600-88e3-11eb-8a0a-4131eada6df3.png">  

## コメント機能  

ツイートに対してのコメントができます。  
ログインしていないユーザーはコメントできない仕様にしました。  
また、コメントは空では投稿できません。  
また、コメントしてからの経過時間(タイムゾーンは日本)がわかるようにしました。  

<img width="1440" alt="コメント" src="https://user-images.githubusercontent.com/78067393/111751121-6fcd3e00-88d7-11eb-97c2-115573fe247a.png">  

## コメントの動きのGIF  

https://user-images.githubusercontent.com/78067393/111756784-f422bf80-88dd-11eb-9f23-95357ec3116a.mp4  

## ツイート検索機能  

ツイートを公園名で検索することができます。  
検索機能の導入のために、ransackを導入しています。  

## ツイート検索の動きのGIF  

https://user-images.githubusercontent.com/78067393/111767840-87fa8880-88ea-11eb-8524-377685c19f33.mp4  

# 工夫したポイント  

・使用者が日本人であることが想定されるので、エラーメッセージを日本語にした。  
・ビューに関しても、ユーザーの見やすさというものを考えて制作しました。  
・コメント機能の部分でデフォルトの設定だと投稿した時刻のみ表示されるが、time_ago_in_wordsを用いて、config/localesにja.yml  
に決まったコードを書くことにより、コメントしてからの時刻のカウントが可能になった。  

# 課題や今後実装したい機能

・ユーザーのフォロー機能  
・ツイートのタグ付け機能(複数のタグつけ可能)  
・ツイートに対してのいいね機能  

# DB設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------  |
| user_name          | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association
- has_many :tweets
- has_many :comments


## tweetテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | -----------------------------  |
| title              | string     | null: false                    |
| text               | text       | null: false                    |
| category_id        | integer    | null: false                    |
| area_id            | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments


## commentテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| text               | string     | null: false                    |
| tweet              | string     | null: false, unique: true      |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :tweet