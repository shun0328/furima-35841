# テーブル設計

## usersテーブル

| Column             | Type   | Options      |
|--------------------|--------|--------------|
| name               | string | null: false  |
| email              | string | unique: true |
| encrypted_password | string | null: false  |
| last_name          | string | null: false  |
| first_name         | string | null: false  |
| last_name_kana     | string | null: false  |
| first_name_kana    | string | null: false  |
| birthday           | date   | null: false  |

### Association
 has_many :items
 has_many :purchases

## itemsテーブル

| Column             | Type       | Options           |
|--------------------|------------|-------------------|
| title              | string     | null: false       |
| text               | text       | null: false       |
| category_id        | integer    | null: false       |
| condition_id       | integer    | null: false       |
| delivery_charge_id | integer    | null: false       |
| delivery_source_id | integer    | null: false       |
| delivery_days_id   | integer    | null: false       |
| price              | integer    | null: false       |
| user               | references | foreign_key: true |

### Association
 belongs_to :user
 has_one :purchase

## purchasesテーブル

| Column | Type       | Options           |
|--------|------------|-------------------|
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |


### Association
 belongs_to :user
 belongs_to :item
 has_one :address

## addressesテーブル

| Column             | Type       | Options           |
|--------------------|------------|-------------------|
| postal_code        | string     | null: false       |
| delivery_source_id | integer    | null: false       |
| municipality       | string     | null: false       |
| house_number       | string     | null: false       |
| building_name      | string     |                   |
| phone_number       | string     | null: false       |
| purchases          | references | foreign_key: true |

### Association
belongs_to :purchase