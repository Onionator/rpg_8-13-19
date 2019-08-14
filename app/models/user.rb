class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :item_users
  has_many :items, through: :item_users

  # attr_accessor :hit_points
  # attr_accessor :attack
  # attr_accessor :defense
  # attr_accessor :name
  # attr_accessor :email
  #
  # def initialize(attributes)
  #   @name = attributes.name
  #   @email = attributes.email
  #   @hit_points = 100
  #   @attack = 5
  #   @defense = 3
  # end

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

  def attack_enemy
    @user = User.find(params[:id])
    max_attack = @user.attack
    equipped_items = ItemUsers.where(user_id: @user.id, equipped: true)
    equipped_items.each do |item|
      max_attack += item.attack
    end
    rand(@user.attack...max_attack)
  end

  def defense_yourself
    @user = User.find(params[:id])
    max_defense = @user.defense
    equipped_items = ItemUsers.where(user_id: @user.id).where(equipped: true)
    equipped_items.each do |item|
      max_defense += item.defense
    end
    max_defense
  end

  def base_stats(hit_points, attack, defense)
    # accessor method to set attribute
    @hit_points = hit_points
    @attack = attack
    @defense = defense
  end



end
