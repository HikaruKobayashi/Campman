class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :follow, class_name: 'User' # 存在しないFollowクラスを参照しないようにする。

  validates :user_id, presence: true
  validates :follow_id, presence: true
end
