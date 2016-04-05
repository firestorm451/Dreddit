class SessionsController < ApplicationController

  before_action :disallow_user, :only => [:new, :create]
  before_action :require_user, :only => [:destroy]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in."
      redirect_to :root
    else
      flash[:warning] = "That email and password is not correct."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have successfully logged out."
    redirect_to :root
  end
end
