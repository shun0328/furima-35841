class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :delivery_source
  belongs_to :delivery_day

  with_options presence: true do
    validates :image
    validates :title
    validates :info
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :delivery_charge_id
    validates :delivery_source_id
    validates :delivery_day_id
  end
end