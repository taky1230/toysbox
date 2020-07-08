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
