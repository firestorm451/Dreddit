class VotesController < ApplicationController

  def create
    @link = Link.find(params[:link_id])
    @link.votes.create
    redirect_to root_url
  end

  def downvote
    @link = Link.find(params[:link_id])
    @link.votes.create
    redirect_to root_url
  end



end
