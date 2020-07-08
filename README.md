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

## toy テーブル

|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false, unique: true|
|description|text|null: false, unipue: true|

### Association
- belongs_to :user

## users テーブル

|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false, unique: true|
|mail|string|null: false, unipue: true|
|password_digest|string|null: false,|

### Association
- has_many :toys


## groups テーブル

|Column|Type|Options|
|------|----|-------|
|name|strig|index: true, null: false, unipue: true|

### Association
- has_many :users, through: :group_users
- has_many :group_users
- has_many :messages


## groups_users テーブル

|Column|Type|Options|
|------|----|-------|
|group|references|foreign_key: true, null: false|
|user|references|foreign_key: true, null: false|

### Association
- belongs_to :group
- belongs_to :user