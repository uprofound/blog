class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
# has_many :users, through: :comments
  has_many :commentators, through: :comments, source: :user
  has_many :seos, as: :seoable

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :title, length: {minimum: 4, maximum: 64}

  scope :written_by_moderators, -> {joins(:user).where(users: {moderator: true})}
# def self.from_moderators
#   Post.where(user_id: User.where(moderator: true))
# end
end
