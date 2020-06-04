class CreateSeos < ActiveRecord::Migration[6.0]
  def change
    create_table :seos do |t|
      t.string :title
      t.string :description
      t.string :keywords
      t.references :user, null: false, foreign_key: true
      t.references :seoable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
