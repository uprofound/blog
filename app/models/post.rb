class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
# has_many :users, through: :comments
  has_many :commentators, through: :comments, source: :user

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :title, length: {minimum: 4, maximum: 64}
end
