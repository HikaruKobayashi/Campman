class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  #フォローする
  def follow
    @user = User.find(params[:user_id])
    current_user.follow(@user)
    redirect_to user_path(@user)
  end

  #フォローを外す
  def unfollow
    @user = User.find(params[:user_id])
    current_user.stop_following(@user)
    redirect_to user_path(@user)
  end


  #フォローしてる人の一覧ページ
  def follow_list
    @user = User.find(params[:user_id])
  end

  #フォロワーの一覧ページ
  def follower_list
    @user = User.find(params[:user_id])
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