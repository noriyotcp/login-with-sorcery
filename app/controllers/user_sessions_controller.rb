class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user.save
      redirect_back_or_to(:users, notice: 'Login successfully')
    else
      flash.now[:alert] = 'Login failed'
      render :new
    end
  end

  def destroy
    logout
    redirect_to(:users, notice: 'Logged out!')
  end
end
