namespace :fill_tables do
  desc 'Fills tables users, posts, comments  with test data'
  task fill_users_posts_comments: :environment do
    (1..5).each do |index|
      indexs = index.to_s 
      iuser = User.create!(name: 'user_rake_' + indexs, email: 'user_rake_' + indexs + '@test.ru')
      puts 'Добавлен пользователь:'
      p iuser
      ipost = Post.create!(title: 'title_rake_' + indexs, body: 'post_body_rake_' + indexs, user: iuser)
      puts 'Добавлено сообщение:'
      p ipost
      icomment = Comment.create!(body: 'comment_body_rake_' + indexs, user: iuser, post: ipost)
      puts 'Добавлен комментарий:'
      p icomment
    end
  end
end


