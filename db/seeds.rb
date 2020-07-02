# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comment.destroy_all
Post.destroy_all
User.destroy_all

hash_users = 10.times.map do
  {
    name: FFaker::Internet.user_name[2...16],
    email: FFaker::Internet.safe_email
  }
end
users = User.create! hash_users
users.first(7).each { |u| u.update creator: true }
users.first(2).each { |u| u.update moderator: true }

creators = User.where(creator: true)
hash_posts = 20.times.map do
  {
    title: FFaker::HipsterIpsum.paragraph[4...64],
    body: FFaker::HipsterIpsum.paragraph,
    user: creators.sample
  }
end
posts = Post.create! hash_posts

hash_comments = 400.times.map do
  commentable = ((rand(2) == 1) ? posts : users).sample
  {
    body: FFaker::HipsterIpsum.paragraph[1...128],
    user: users.sample,
    commentable_id: commentable.id,
    commentable_type: commentable.class.to_s
  }
end
Comment.create! hash_comments

