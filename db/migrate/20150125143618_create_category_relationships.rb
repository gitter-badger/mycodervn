class CreateCategoryRelationships < ActiveRecord::Migration
  def up
    create_table :category_relationships, id: false, force: true do |t|
   	  t.integer :category_id, null: false, :limit => 8
      t.integer :object_id, null: false, :limit => 8
    end
    execute "ALTER TABLE category_relationships ADD PRIMARY KEY (category_id, object_id);"
    add_index "category_relationships", ["category_id"], name: "category_id_idx", using: :btree
    add_index "category_relationships", ["object_id"], name: "object_id_idx", using: :btree
    
  end

  def down
  	drop_table :category_relationships
  end
end
