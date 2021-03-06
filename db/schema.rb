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

ActiveRecord::Schema.define(version: 20160929003007) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "shortened_urls", force: :cascade do |t|
    t.string   "long_url"
    t.string   "short_url"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shortened_urls", ["short_url"], name: "index_shortened_urls_on_short_url", using: :btree
  add_index "shortened_urls", ["user_id"], name: "index_shortened_urls_on_user_id", using: :btree

  create_table "tag_topics", force: :cascade do |t|
    t.string   "tag_topic",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tag_topics", ["tag_topic"], name: "index_tag_topics_on_tag_topic", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "shortened_url_id", null: false
    t.integer  "tag_topic_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taggings", ["shortened_url_id"], name: "index_taggings_on_shortened_url_id", using: :btree
  add_index "taggings", ["tag_topic_id"], name: "index_taggings_on_tag_topic_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "premium"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree

  create_table "visits", force: :cascade do |t|
    t.integer  "visitor_id", null: false
    t.integer  "page_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "visits", ["page_id"], name: "index_visits_on_page_id", using: :btree
  add_index "visits", ["visitor_id"], name: "index_visits_on_visitor_id", using: :btree

end
