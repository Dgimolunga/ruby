class PostsController < ApplicationController

  before_action :set_post, only: %i[show edit update destroy ]

  def index
    @posts = Post.all
  end

	def show
		@comments = @post.comments
    @new_comment = @post.comments.build
  end

	def new
		@post = Post.new
  end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to @post
		else
			render :new
		end
	end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post)
          .permit(:title, :content, :published_at)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
