class CreateProfiles < ActiveRecord::Migration
  def up
    create_table :profiles, primary_key: "user_id", force: true do |t|
      #0: female, 1: made
      t.integer :gender, null:false, :limit => 1, default: 0
      t.text :avatar
      t.datetime :birth_day
    end
  end

  def down
  	drop_table :profiles
  end
end
