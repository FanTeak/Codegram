class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :rememberable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :validatable
  validates :email, presence: true, length: {in: 5..25}, format: {with: /[A-Za-z0-9@A-Za-z0-9]/}
  validates :username, presence: true, length: {in: 3..25}, format: {with: /[A-Za-z0-9]/}
  has_many :posts, foreign_key: :author_id, dependent: :destroy

  ROLES = {
  user: 0,
  moderator: 1,
  admin: 2,
  }.with_indifferent_access.freeze

  enum role: ROLES
end
