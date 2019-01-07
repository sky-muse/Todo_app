class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 20}
    #メアド正規表現「~ @ ~ . ~」の形を許可。uniqueness⇨重複してないか
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  # validates :email, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  #パスワードをアルファベット、数字の混合のみ可能
  validates :password, presence: true, format: { with: /\A[a-z\d]{8,32}+\z/i }
  has_secure_password

  has_many :tasks
end
