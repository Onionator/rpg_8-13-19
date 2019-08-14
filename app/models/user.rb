class User < ApplicationRecord
  has_many :item_users
  has_many :items, through: :item_users

  def save_to_inventory
    @user = User.find(params[:id])
    @item = Item.find(1)
    @user.items.push(@item)
  end

  def equip
    @user = User.find(params[:id])
    @item = Item.find(params[:id])
    item = ItemUsers.where(user_id: @user.id, item_id: @item.id)
    item.equipped = true
  end

  def attack
    @user = User.find(params[:id])
    max_attack = @user.attack
    equipped_items = ItemUsers.where(user_id: @user.id, equipped: true)
    equipped_items.each do |item|
      max_attack += item.attack
    end
    rand(@user.attack...max_attack)
  end

  def defense
    @user = User.find(params[:id])
    max_defense = @user.defense
    equipped_items = ItemUsers.where(user_id: @user.id).where(equipped: true)
    equipped_items.each do |item|
      max_defense += item.defense
    end
    max_defense
  end
end
