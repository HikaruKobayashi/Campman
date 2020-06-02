class User < ApplicationRecord
  # usersテーブルにパスワードを保存する時にパスワードを暗号化させる。
  has_secure_password

  has_many :relationships, foreign_key: 'user_id'
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user

  def follow(other_user)
    # フォローしようとしている人が自分自身でないことを確認する。
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    # 既にフォローしていた場合にアンフォローにする。
    relationships = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
end
