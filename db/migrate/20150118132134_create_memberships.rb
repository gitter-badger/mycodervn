class CreateMemberships < ActiveRecord::Migration
  def up
    create_table :memberships, primary_key: "user_id", force: true do |t|
      t.integer :application_id, null: false, :limit => 1
      t.string :pass_word, null: false, :limit => 255
      #0: plaintext, 1: hash, 2: encrypt
      t.integer :pass_word_format, :limit => 1, default: 1
      t.string :pass_word_salt, :limit => 128
      t.string :user_name, :limit => 255
      t.string :email, null: false, :limit => 255
      t.string :low_email, null:false, :limit => 255
      t.string :mobile_pin, :limit => 16
      t.string :pass_word_question, :limit => 255
      t.string :pass_word_answer, :limit => 255
      t.integer :is_approved, null: false, :limit => 1, default: 0
      t.integer :is_locked_out, null: false, :limit => 1, default: 1
      t.datetime :last_login_date
      t.datetime :last_change_pass_date
      t.datetime :last_locked_date
      t.integer :failed_pass_attempt_cout, :limit => 1
      t.string :comment, :limit => 255

      t.timestamps null: false
    end

    execute "ALTER TABLE memberships MODIFY COLUMN user_id BIGINT(20) auto_increment;"
    add_index "memberships", ["application_id"], name: "application_id_idx", using: :btree
    add_index "memberships", ["user_name"], name: "user_name_idx", using: :btree
    add_index "memberships", ["low_email"], name: "low_email_idx", using: :btree
  end

  def down
  	drop_table :memberships
  end
end
