class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to users_path # ログインが成功したらページ遷移
    else
      render 'new' # ログインに失敗したらログインページを再度表示
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end