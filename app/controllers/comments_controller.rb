class CommentsController < ApplicationController

  def new
  end
  def create
    @new_comment = Comment.new(post_params)
    @new_comment.post_id = params[:id]
    if @new_comment.save
      redirect_to posts_path
    else
      render "posts/show"
    end

  end


  private
  def post_params

  		params.require(:comment).permit(:text_commet)

  end



end
