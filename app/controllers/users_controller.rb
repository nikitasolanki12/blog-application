class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'User successfully created.'
    else
      render :new
    end
  end

  def login
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
       redirect_to blogs_path, notice: 'Logged in successfully.'
    else
      flash.now[:alert] = 'Invalid email or password'
        render :new
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out successfully.'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
