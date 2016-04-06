class CommentsController < ApplicationController
  before_action :comment_link, only: [:destroy]

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user_id
    redirect_to root_url
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
    params.require(:comment).permit(:body, :link_id, :user_id)
  end
end
