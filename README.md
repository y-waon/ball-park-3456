# README

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------  |
| user_name          | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

## tweetテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | -----------------------------  |
| title              | string     | null: false                    |
| text               | text       | null: false                    |
| place              | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

## commentテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| text               | string     | null: false, unique: true      |
| user               | references | null: false, foreign_key: true |