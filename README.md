# テーブル設計

## usersテーブル

| Column             | Type   | Options     |
|--------------------|--------|-------------|
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association
 has_many :items
 has_many :purchases

## itemsテーブル

| Column             | Type      | Options     |
|--------------------|-----------|-------------|
| title              | string    | null: false |
| text               | text      | null: false |
| category_id        | integer   | null: false |
| condition_id       | integer   | null: false |
| delivery_charge_id | integer   | null: false |
| delivery_source_id | integer   | null: false |
| delivery_days_id   | integer   | null: false |
| price              | integger  | null: false |

### Association
 belongs_to :users
 has_one :purchases

## purchasesテーブル

| Column | Type       | Options     |
|--------|------------|-------------|
| user   | references | null: false |
| item   | references | null: false |


### Association
 belongs_to :users
 belongs_to :items
 has_one :addresses

## addressesテーブル

| Column        | Type    | Options     |
|---------------|---------|-------------|
| postal_code   | integer | null: false |
| prefecture_id | integer | null: false |
| municipality  | string  | null: false |
| house_number  | integer | null: false |
| building_name | string  | null: false |
| phone_number  | string  | null: false |

### Association
belongs_to :purchases