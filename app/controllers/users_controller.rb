class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user!(user)
      render user_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end


  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
