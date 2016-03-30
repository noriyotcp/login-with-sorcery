class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
    @user = User.new
  end

  def create
    # params[:login] is username or email
    if @user = login(params[:login], params[:password], params[:remember_me])
      redirect_back_or_to(:users, notice: 'Login successfully')
    else
      flash.now[:alert] = 'Login failed'
      render :new
    end
  end

  def destroy
    remember_me!
    forget_me!
    logout
    redirect_to(:users, notice: 'Logged out!')
  end
end
