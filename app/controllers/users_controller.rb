class UsersController < ApplicationController
  def index
    @bookDataAdd = Book.new
    @userAll = User.all
  end
  def show
    @bookDataAdd = Book.new
    @targetUser = User.find(params[:id])
    @bookAll = Book.where(user_id: params[:id]);
  end
  def edit
    @user = User.find(current_user.id)
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      @bookDataAdd = Book.new
      @userAll = User.all
      render :index
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
