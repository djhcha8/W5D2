class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if user
      login(user)
      #redirec_to
    else
      flash[:errors] = 'Invalid credentials'
      render :new
  end

  def destroy
    logout
    redirect_to new_session_url
  end
end
