class VotesController < ApplicationController
  before_action :require_user

  def create
    @link = Link.find(params[:link_id])
    @link.votes.create(user: current_user)
    redirect_to root_url
  end

  def downvote
    @link = Link.find(params[:link_id])
    @link.votes.create
    redirect_to root_url
  end

end
