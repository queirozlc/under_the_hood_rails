class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :member
  validates_presence_of :body
  validates_length_of :body, minimum: 5
end
