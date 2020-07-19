class User < ApplicationRecord
  before_save { self.email = email.downcase } # emailの値をdowncaseメソッドを使って小文字に変換します。
  
  validates :name, presence: true, length: { maximum: 50} # nameの検証、存在性の確認、最大50文字まで
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 100 }, # emailの検証 存在性の検証、最大100文字まで、emailで必要な文字列の確認、一意性の検証
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  has_secure_password  # パスワードの検証、ハッシュ化、存在性の検証、最小6文字から
  validates :password, presence: true, length: { minimum: 6 }
end