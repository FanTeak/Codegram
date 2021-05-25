class CommentPolicy < ApplicationPolicy
    def destroy?
        if login?
            record.post.author_id == user.id || admin? || moderator?
        end
    end
end