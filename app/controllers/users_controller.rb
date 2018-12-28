class UsersController < ApplicationController
  # def index
  #   @users = User.all
  # end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, success: '登録が完了しました'
    else
      flash[:danger] = "登録に失敗しました"
      redirect_to new_user_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
