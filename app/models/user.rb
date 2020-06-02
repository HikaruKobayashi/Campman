class User < ApplicationRecord
  # usersテーブルにパスワードを保存する時にパスワードを暗号化させる。
  has_secure_password
end
