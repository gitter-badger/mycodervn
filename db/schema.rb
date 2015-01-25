# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150125145237) do

  create_table "applications", primary_key: "application_id", force: :cascade do |t|
    t.string "application_name",        limit: 128,   null: false
    t.string "applications_name_ascii", limit: 128,   null: false
    t.text   "description",             limit: 65535
  end

  add_index "applications", ["application_name"], name: "application_name_idx", using: :btree

  create_table "categories", primary_key: "category_id", force: :cascade do |t|
    t.string  "category_name",       limit: 255,   null: false
    t.string  "category_name_ascii", limit: 255,   null: false
    t.text    "description",         limit: 65535
    t.string  "category_group",      limit: 8
    t.integer "order",               limit: 4
  end

  create_table "category_relationships", id: false, force: :cascade do |t|
    t.integer "category_id", limit: 8, null: false
    t.integer "object_id",   limit: 8, null: false
  end

  add_index "category_relationships", ["category_id"], name: "category_id_idx", using: :btree
  add_index "category_relationships", ["object_id"], name: "object_id_idx", using: :btree

  create_table "memberships", primary_key: "user_id", force: :cascade do |t|
    t.integer  "application_id",           limit: 1,               null: false
    t.string   "pass_word",                limit: 255,             null: false
    t.integer  "pass_word_format",         limit: 1,   default: 1
    t.string   "pass_word_salt",           limit: 128
    t.string   "user_name",                limit: 255
    t.string   "email",                    limit: 255,             null: false
    t.string   "low_email",                limit: 255,             null: false
    t.string   "mobile_pin",               limit: 16
    t.string   "pass_word_question",       limit: 255
    t.string   "pass_word_answer",         limit: 255
    t.integer  "is_approved",              limit: 1,   default: 0, null: false
    t.integer  "is_locked_out",            limit: 1,   default: 1, null: false
    t.datetime "last_login_date"
    t.datetime "last_change_pass_date"
    t.datetime "last_locked_date"
    t.integer  "failed_pass_attempt_cout", limit: 1
    t.string   "comment",                  limit: 255
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "memberships", ["application_id"], name: "application_id_idx", using: :btree
  add_index "memberships", ["low_email"], name: "low_email_idx", using: :btree
  add_index "memberships", ["user_name"], name: "user_name_idx", using: :btree

  create_table "postmeta", primary_key: "meta_id", force: :cascade do |t|
    t.integer "post_id",    limit: 8,     null: false
    t.string  "meta_key",   limit: 20,    null: false
    t.text    "meta_value", limit: 65535, null: false
  end

  add_index "postmeta", ["meta_key"], name: "meta_key_idx", using: :btree
  add_index "postmeta", ["post_id"], name: "post_id_idx", using: :btree

  create_table "profiles", primary_key: "user_id", force: :cascade do |t|
    t.integer  "gender",    limit: 1,     default: 0, null: false
    t.text     "avatar",    limit: 65535
    t.datetime "birth_day"
  end

  create_table "roles", primary_key: "role_id", force: :cascade do |t|
    t.string   "role_name",     limit: 255,   null: false
    t.string   "role_name_low", limit: 255,   null: false
    t.text     "description",   limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "roles", ["role_name"], name: "role_name_idx", using: :btree

  create_table "roles_relationships", id: false, force: :cascade do |t|
    t.integer "role_id",   limit: 4, null: false
    t.integer "object_id", limit: 8, null: false
  end

  add_index "roles_relationships", ["object_id"], name: "object_id_idx", using: :btree
  add_index "roles_relationships", ["role_id"], name: "role_id_idx", using: :btree

end
