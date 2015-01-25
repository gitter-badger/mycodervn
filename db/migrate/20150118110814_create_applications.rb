class CreateApplications < ActiveRecord::Migration
  def up
    create_table :applications, primary_key: "application_id", force: true do |t|
      t.string :application_name, :limit => 128	, null: false
      t.string :applications_name_ascii, :limit => 128, null: false
      t.text :description
    end

    execute "ALTER TABLE applications MODIFY COLUMN application_id TINYINT(4) auto_increment;"
    add_index "applications", ["application_name"], name: "application_name_idx", using: :btree
  end

  def down
  	drop_table :applications
  end
end
