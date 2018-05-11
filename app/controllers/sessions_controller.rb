class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    if user.nil?
      flash.now[:errors] = ["Incorrect Username or Password"]
      render :new
    else
      login!(user)
      redirect_to user_url
    end
  end

  def destroy
    logout_user!
    redirect_to new_session_url
  end

  def show
    render :show
  end

end
