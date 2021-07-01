class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :delivery_source_id, :municipality, :house_number, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/,}
    validates :municipality
    validates :house_number
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
    validates :token
  end
  validates :delivery_source_id, numericality: {other_than: 1}

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, delivery_source_id: delivery_source_id, municipality: municipality, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end