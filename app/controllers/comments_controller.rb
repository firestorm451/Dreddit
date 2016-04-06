class CommentsController < ApplicationController
  before_action :require_user

  def create
    @link = Link.find(params[:link_id])
    @comment = @link.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:success] = "That's what the internet needs, more comments."
      redirect_to :back
    else
      @link = Link.find(params[:comment][:link_id])
      render template: 'links/show'
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
