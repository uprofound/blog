class AddCommentsCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :comments_count, :integer
  end
end
