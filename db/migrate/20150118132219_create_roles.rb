class CreateRoles < ActiveRecord::Migration
  def up
    create_table :roles, primary_key: "role_id", force: true  do |t|
      t.string :role_name, null: false, :limit => 255
      t.string :role_name_low, null: false, :limit => 255
      t.text :description

      t.timestamps null: false
    end
    
    add_index "roles", ["role_name"], name: "role_name_idx", using: :btree
  end

  def down
  	drop_table :roles
  end
end
