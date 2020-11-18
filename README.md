# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## users テーブル

| Column   | Type   | Options                   |
| -------- | ------ | ------------------------- |
| nickname | string | null: false               |
| email    | string | null: false, unique: true |
| password | string | null: false               |
| name     | string | null: false               |
| birthday | string | null: false               |

### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| image        | string     | null: false                    |
| name         | string     | null: false                    |
| details      | text       | null: false                    |
| category     | string     | null: false                    |
| condition    | string     | null: false                    |
| delivery_fee | string     | null: false                    |
| area         | string     | null: false                    |
| days         | string     | null: false                    |
| price        | string     | null: false                    |
| user_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_record

## purchase_records テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| purchase_date | integer    | null: false                    |
| purchase_item | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| postal_code  | integer | null: false |
| prefecture   | strings | null: false |
| city         | strings | null: false |
| address      | strings | null: false |
| phone_number | strings | null: false |

### Association

- belongs_to :purchase_record