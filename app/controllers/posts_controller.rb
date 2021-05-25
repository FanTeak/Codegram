class PostsController < ApplicationController
	before_action :authenticate_user!, only: %i[new create edit update destroy]

	def index
		@posts = Post.ordered.with_authors.search(params[:query]).paginate(page: params[:page])
		authorize Post
	end

	def show
		@post = Post.find(params[:id])
		authorize @post
	end

	def new
		@post = Post.new
		authorize Post
	end

	def create
		@post = Post.new(post_params)
		authorize Post
		@post.author = current_user
		if(@post.save)
			redirect_to @post, notice: "Post was successfully created."
		else
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:id])
		authorize @post
	end

	def update
		@post = Post.find(params[:id])
		authorize @post
		if(@post.update(post_params))
			redirect_to @post, notice: "Post was successfully updated."
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		authorize @post
		@post.comments.each do |comment|
			comment.destroy
		end
		@post.destroy
		redirect_to posts_path, notice: "Post was successfully deleted."
	end

	private def post_params
		params.require(:post).permit(:title, :body)
	end
end
