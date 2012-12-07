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

ActiveRecord::Schema.define do

  migrations do
    migration 20121207094108, "0faf2c01f20afb8d55e5f5b3bc125dde", "create_posts"
    migration 20121207094159, "1cf3b3fdb18b3f2059a70eaf1128b60b", "create_comments"
  end

  create_table "comments", force: true do |t|
    t.string   "content"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.string   "body"
    t.integer  "comments_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
