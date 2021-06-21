class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name
    validates :birthday
    with_options format: {
                  with: /\A[ぁ-んァ-ン一-龥々ー]+\z/,
                  message: "is invalid. Input full-width characters"
                } do
      validates :last_name
      validates :first_name
    end
    with_options format: {
                  with: /[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/,
                  message: "is invalid. Input full-width katakana characters"
                } do
      validates :last_name_kana
      validates :first_name_kana
    end
  end
  validates :password,
            format: {
              with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i,
              message: "is invalid. Include both letters and numbers"
            }
            
  has_many :items
end
