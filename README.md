# README

## アプリケーション名

BALL-SEARCH

## アプリケーションの要件

ユーザー新規登録機能
ユーザーログイン機能
新規ツイート機能
ツイート編集機能
ツイート削除機能
コメント機能
ツイート検索機能

## URL

https://ball-park-3456.herokuapp.com/

## 利用方法

新規登録から登録、NEW TWEETから写真付きで投稿する、投稿に対してコメントを行う

## 目指した課題解決

最近だと、公園などでボール遊びが禁止であったりして、子供の外での活動が少なくなっていると感じた。
また、スポーツ人口も、少子高齢化のあおりもあるが、徐々にだが減りつつあリます。
このことから、まずは身近なところから、運動する場所を見つけてもらおうとこのアプリケーションを作成した。

## 実装機能についての説明

・ユーザー新規登録機能、ユーザーログイン機能

deviseを用いて実装しました。メールアドレス、パスワード、ユーザー名を入力すれば登録できるようになっています。
また、ログイン機能の方は、メールアドレスとパスワードの入力でログインできます。
また、エラーメッセージは、日本語の表示になるように、rails-i18nのgemを導入しました。

・新規ツイート機能

新規ツイートする際には、全てバリデーションをかけているため、どこかの項目に空だと投稿できないようになっています。
投稿されたツイートは、トップページに表示されます。
また、ユーザー新規登録機能、ユーザーログイン機能と同様に、rails-i18nのgemを導入しました。

・ツイート削除機能・ツイート編集機能

ツイートの詳細画面にて投稿したユーザーのみが、編集・削除できます。

・コメント機能

ツイートに対してのコメントができます。
ログインしていないユーザーはコメントできない仕様にしました。
また、コメントは空では投稿できません。
また、コメントしてからの経過時間(タイムゾーンは日本)がわかるようにしました。

・ツイート検索機能

ツイートを公園名で検索することができます。
検索機能の導入のために、ransackを導入しています。

# 工夫したポイント

・使用者が日本人であることが想定されるので、エラーメッセージを日本語にした。
・ビューに関しても、ユーザーの見やすさというものを考えて制作しました。
・コメント機能の部分でデフォルトの設定だと投稿した時刻のみ表示されるが、time_ago_in_wordsを用いて、config/localesにja.yml
に決まったコードを書くことにより、コメントしてからの時刻のカウントが可能になった。


# 課題や今後実装したい機能

・ユーザーのフォロー機能
・ツイートのタグ付け機能(複数のタグつけ可能)


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
| title              | string     | null: false                    |
| text               | string     | null: false, unique: true      |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :tweet