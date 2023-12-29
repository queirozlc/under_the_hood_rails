class Post < ApplicationRecord
  validates_presence_of :title, :body
  validates_length_of :title, minimum: 3
  validates_length_of :body, minimum: 10
  belongs_to :member
end
