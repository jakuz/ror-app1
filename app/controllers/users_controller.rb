class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "User '#{@user.name}' has been destroyed."
      redirect_to users_path
    else
      flash[:alert] = 'Something wen wrong when deleting user.'
      redirect_to users_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
