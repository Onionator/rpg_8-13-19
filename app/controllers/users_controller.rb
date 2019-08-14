class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(current_user.id)
    @equipped_items = ItemUsers.where(user_id: @user.id, equipped: true)
    @items = ItemUsers.where(user_id: @user.id)
    render :show
    render :index
  end


  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_session_path
    else
      render :new
    end
  end

  def show
    redirect_to root_path
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :encrypted_password)
  end

end
