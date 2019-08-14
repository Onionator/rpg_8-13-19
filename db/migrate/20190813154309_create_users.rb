class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.integer :hit_points,  default: 100
      t.integer :attack, default: 5
      t.integer :defense, default: 3

      t.timestamps
    end
  end
end
