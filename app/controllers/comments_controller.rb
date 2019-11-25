class CommentsController < ApplicationController

  def new; end

  def create
    @new_comment = Comment.new(comment_params)
    if @new_comment.save
      redirect_to post_path(@new_comment.post)
    else
      render "posts/show"
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:text_comment, :post_id)
  end
end
