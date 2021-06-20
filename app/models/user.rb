class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :last_name, presence: true,
            format: {
              with: /\A[ぁ-んァ-ン一-龥]/,
              message: "is invalid. Input full-width characters"
            }
  validates :first_name, presence: true,
            format: {
              with: /\A[ぁ-んァ-ン一-龥]/,
              message: "is invalid. Input full-width characters"
            }
  validates :last_name_kana, presence: true,
            format: {
              with: /[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/,
              message: "is invalid. Input full-width katakana characters"
            }
  validates :first_name_kana, presence: true,
            format: {
              with: /[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/,
              message: "is invalid. Input full-width katakana characters"
            }
  validates :birthday, presence: true
  validates :password, presence: true,
            format: {
              with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i,
              message: "is invalid. Include both letters and numbers"
            }
end
