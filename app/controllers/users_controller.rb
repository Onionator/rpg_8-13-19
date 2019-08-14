class UsersController < ApplicationController

  def index
    @users = User.all
    @items = Item.all
    render :index
  end

  def show
    @user = User.find(params[:id])
    @equipped_items = ItemUsers.where(user_id: @user.id, equipped: true)
    @items = ItemUsers.where(user_id: @user.id)
    render :show
  end




end
