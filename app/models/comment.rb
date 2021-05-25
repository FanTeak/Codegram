class Comment < ApplicationRecord
  belongs_to :post
  validates :username, presence: true, length: {in: 3..25}
  validates :body, presence: true, length: {in: 5..1000}
end
