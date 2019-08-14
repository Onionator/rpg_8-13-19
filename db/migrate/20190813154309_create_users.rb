class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.integer :hit_points, null: false, default: 100
      t.integer :attack, null: false, default: 5
      t.integer :defense, null: false, default: 3

      t.timestamps
    end
  end
end
