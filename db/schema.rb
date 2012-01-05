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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120104165311) do

  create_table "access_levels", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ad_types", :force => true do |t|
    t.string   "name"
    t.integer  "value"
    t.string   "invoice_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ads", :force => true do |t|
    t.string   "name"
    t.string   "contact"
    t.string   "phone"
    t.string   "email"
    t.integer  "ad_type_id"
    t.text     "address"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authentications", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.string   "provider",   :null => false
    t.string   "uid",        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "band_members", :force => true do |t|
    t.string   "band_id",    :limit => 36
    t.string   "name"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "person_id"
  end

  create_table "bands", :id => false, :force => true do |t|
    t.string   "uuid",               :limit => 36
    t.string   "name"
    t.string   "contact_name"
    t.string   "email"
    t.string   "phone"
    t.text     "address"
    t.text     "description"
    t.string   "song_title"
    t.string   "song_composer"
    t.text     "song_lyrics"
    t.string   "playtime_wish"
    t.string   "playtime_wish_alt"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "crew_applications", :force => true do |t|
    t.string   "name"
    t.text     "address"
    t.date     "birthday"
    t.string   "email"
    t.string   "phone"
    t.text     "experience"
    t.integer  "volunteer_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "crew_wishes", :force => true do |t|
    t.integer  "crew_application_id"
    t.integer  "group_id"
    t.integer  "priority"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fireguards", :force => true do |t|
    t.string   "name"
    t.integer  "age"
    t.text     "address"
    t.string   "phone"
    t.string   "mobile"
    t.string   "email"
    t.text     "notes"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.boolean  "internal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "location_schedules", :force => true do |t|
    t.integer  "location_id"
    t.integer  "fireguard_id"
    t.integer  "slot"
    t.datetime "from"
    t.datetime "to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.integer  "slots"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "email"
    t.string   "phone",      :limit => 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stage_schedules", :force => true do |t|
    t.integer  "stage_id"
    t.string   "band_id",    :limit => 36
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stages", :force => true do |t|
    t.string   "name"
    t.datetime "from"
    t.datetime "to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_roles", :force => true do |t|
    t.string  "title"
    t.integer "user_id"
    t.integer "role_id"
  end

  create_table "users", :force => true do |t|
    t.string   "username",                        :null => false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "name"
  end

  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token"

  create_table "volunteers", :force => true do |t|
    t.string   "name"
    t.text     "address"
    t.date     "birthday"
    t.string   "email"
    t.string   "phone"
    t.integer  "group_id"
    t.string   "access_level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
