class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :title, length: {minimum: 4, maximum: 64}
end
