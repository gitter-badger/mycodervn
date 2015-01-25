class CreateRolesRelationships < ActiveRecord::Migration
  def up
    create_table :roles_relationships, id: false, force: true do |t|
      t.integer :role_id, null: false
      t.integer :object_id, null: false, :limit => 8
    end

    execute "ALTER TABLE roles_relationships ADD PRIMARY KEY (role_id, object_id);"
    add_index "roles_relationships", ["role_id"], name: "role_id_idx", using: :btree
    add_index "roles_relationships", ["object_id"], name: "object_id_idx", using: :btree
  end

  def down
  	drop_table :roles_relationships
  end
end
