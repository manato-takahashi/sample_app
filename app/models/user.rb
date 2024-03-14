class User < ApplicationRecord
  validates :name, presence: true
  # 上記は validates(:name, presence: true) と書いても同じ
  validates :email, presence: true
end
