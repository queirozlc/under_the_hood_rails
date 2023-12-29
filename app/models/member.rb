class Member < ApplicationRecord
  validates_presence_of :name, :email
  validates_uniqueness_of :email
  validates_length_of :name, minimum: 3
  validates_format_of :email, with: /@/
  has_many :posts
end

