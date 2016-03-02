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

ActiveRecord::Schema.define(version: 20160229041144) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.string   "uid"
    t.string   "token"
    t.string   "provider"
    t.string   "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "listings", force: :cascade do |t|
    t.integer  "user_id",            null: false
    t.string   "title",              null: false
    t.text     "description",        null: false
    t.string   "street_address",     null: false
    t.string   "city",               null: false
    t.string   "country",            null: false
    t.string   "property_type",      null: false
    t.integer  "number_of_guests",   null: false
    t.integer  "number_of_bedrooms", null: false
    t.integer  "number_of_beds",     null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.json     "avatars"
    t.integer  "price"
    t.date     "start"
    t.date     "end"
  end

  create_table "reservations", force: :cascade do |t|
    t.string   "check_in"
    t.string   "check_out"
    t.integer  "guests"
    t.integer  "user_id"
    t.integer  "listing_id"
    t.integer  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
