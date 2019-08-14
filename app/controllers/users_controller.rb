class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(current_user.id)
    @equipped_items = ItemUsers.where(user_id: @user.id, equipped: true)
    @items = ItemUsers.where(user_id: @user.id)
    render :index
  end


  def new
    @user = User.new
    render :new
  end

  # def create
  #   @user = User.new(user_params)
  #   @user.attack = 9
  #   byebug
  #   if @user.save
  #     redirect_to user_session_path
  #   else
  #     render :new
  #   end
  # end

  def show
    @user = User.find(current_user.id)
    @equipped_items = ItemUsers.where(user_id: @user.id, equipped: true)
    @items = ItemUsers.where(user_id: @user.id)
    render :show
  end

  def destroy
  end

  # private
  # def user_params
  #   params.require(:user).permit(:name, :email, :encrypted_password, :attack, :hit_points, :defense)
  # end

end
