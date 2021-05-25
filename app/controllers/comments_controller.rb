class CommentsController < ApplicationController
	before_action :authenticate_user!, only: %i[new create destroy]

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)
		@comment.username = current_user.username
		@comment.save
		redirect_to post_path(@post), notice: "Comment was successfully created."
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		authorize @comment
		@comment.destroy
		redirect_to post_path(@post), notice: "Comment was successfully deleted."
	end

	private def comment_params
		params.require(:comment).permit(:body)
	end
end
