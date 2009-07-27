# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090709042556) do

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.string   "css_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "startdate"
    t.datetime "enddate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_image_url"
    t.string   "owner"
  end

  create_table "resources", :force => true do |t|
    t.string   "title"
    t.string   "department"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
  end

  create_table "tasks", :force => true do |t|
    t.integer  "task_number"
    t.string   "title"
    t.text     "description"
    t.string   "status"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "resource"
    t.date     "startdate"
    t.date     "enddate"
    t.string   "estimate"
    t.integer  "position"
    t.datetime "completed_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.integer  "failed_login_count"
    t.datetime "last_login_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "firstname"
    t.string   "lastname"
  end

end
