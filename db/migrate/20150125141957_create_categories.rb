class CreateCategories < ActiveRecord::Migration
  def up
    create_table :categories, primary_key: "category_id", force: true do |t|
   	  t.string :category_name, null: false, :limit => 255
   	  t.string :category_name_ascii, null: false, :limit => 255
   	  t.text :description
      t.string :category_group, :limit => 8
   	  t.integer :order
    end

    execute "ALTER TABLE categories MODIFY COLUMN category_id BIGINT(8) auto_increment;"
  end

  def down
  	drop_table :categories
  end
end
