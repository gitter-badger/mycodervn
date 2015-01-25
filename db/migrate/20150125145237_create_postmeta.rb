class CreatePostmeta < ActiveRecord::Migration
  def up
    create_table :postmeta, primary_key: "meta_id", force: true do |t|
   	  t.integer :post_id, null: false, :limit => 8
   	  t.string :meta_key, null:false, :limit => 20
   	  t.text :meta_value, null: false
    end
    execute "ALTER TABLE postmeta MODIFY COLUMN meta_id BIGINT(8) auto_increment;"
    add_index "postmeta", ["post_id"], name: "post_id_idx", using: :btree
    add_index "postmeta", ["meta_key"], name: "meta_key_idx", using: :btree
  end

  def down
  	drop_table :postmeta
  end
end
