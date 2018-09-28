class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @blog = Blog.find(params[:blog_id])
    @comment = current_user.comments.new(comment_params)
    @comment.blog = @blog
    if (@comment.save)
      redirect_to "/blogs/#{params[:blog_id]}"
    else
      render '/'
    end
  end

  def show 
    @comment = Comment.find(params[:id])
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :blog_id, :user_id)
  end

end
