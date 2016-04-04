class VotesController < ApplicationController


  def index
  end
  
  def create
    @link = Link.find(params[:link_id])
    @link.votes.create
    redirect_to root_url
  end

  def show
    @link.votes.create
    redirect_to @link.url
  end

  def downvote
    @link = Link.find(params[:link_id])
    @link.votes.create
    redirect_to root_url
  end

  private

  def vote_params
    params.require(:vote).permit(:link_id, :value)
  end


end
