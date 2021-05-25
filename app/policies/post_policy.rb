class PostPolicy < ApplicationPolicy
	def index?
		true
	end

	def show?
		true
	end

	def create?
		login?
	end

	def update?
		author? || admin?
	end

	def destroy?
		author? || admin?
	end

	private def author?
		login? && record.author_id == user.id
	end
end