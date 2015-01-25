class CreatePosts < ActiveRecord::Migration
  def post
    create_table :posts, primary_key: "post_id", force: true do |t|
    	#Post author
    	t.integer :post_author, null: false, :limit => 8
    	#Post title ex: example post
    	t.text :post_title, null: false
    	#Post ascii ex: example-post
    	t.string :post_name, null:false, :limit => 255
    	#Post content
    	t.text :post_content, :limit => 4294967295
    	#Post exceprt for seo
    	t.text :post_exceprt
    	#Post status ex: public
    	t.string :post_status, null: false, :limit => 8
    	#Post post password for protect
    	t.string :post_password, :limit => 20
    	#Post parent
    	t.integer :post_parent, :limit => 8
    	#Post type
    	t.string :post_type, :limit => 8
    	#Comment count
    	t.integer :comment_count, :limit => 8

    	t.timestamps null: false
    end
    execute "ALTER TABLE posts MODIFY COLUMN post_id BIGINT(8) auto_increment;"
    add_index "posts", ["post_name"], name: "post_name_idx", using: :btree
    add_index "posts", ["post_author"], name: "post_author_idx", using: :btree
    add_index "posts", ["post_parent"], name: "post_parent_idx", using: :btree	

  end

  def down
  	drop_table :posts
  end
end
