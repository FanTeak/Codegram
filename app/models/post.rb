class Post < ApplicationRecord
	belongs_to :author, class_name: 'User'
	has_many :comments

	self.per_page = 2

	validates :title, presence: true, length: {in: 3..25}, format: {with: /[A-Za-z0-9 \n\t]/}
	validates :body, presence: true, length: {in: 5..1000}

	scope :ordered, ->(direction = :desc) { order(created_at: direction) }
	scope :with_authors, -> { includes(:author) }
	scope :search, ->(query) do
		return if query.blank?
			where('title LIKE ? OR title LIKE ? OR body LIKE ? OR body LIKE ?', "#{query.squish}%", "% #{query.squish}%", "#{query.squish}%", "% #{query.squish}%")
	end

	scope :Filter, ->(filter) do
		if filter == 'common'
			where(theme: Post::THEMES[:common])
		elsif filter == 'sport'
			where(theme: Post::THEMES[:sport])
		elsif filter == 'science'
			where(theme: Post::THEMES[:science])
		elsif filter == 'games'
			where(theme: Post::THEMES[:games])
		elsif filter == 'technique'
			where(theme: Post::THEMES[:technique])
		end
	end

	THEMES = {
		common: 0,
		sport: 1,
		science: 2,
		games: 3,
		technique: 4
	}.with_indifferent_access.freeze

	enum theme: THEMES
end
