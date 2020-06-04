class Seo < ApplicationRecord
  belongs_to :user
  belongs_to :seoable, polymorphic: true
end
