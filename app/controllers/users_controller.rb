class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save!
      session[:user_id] = @user.id
      redirect_to("/")
    else
      render("/users/new")
    end
  end


  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    redirect_to('/users')
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end