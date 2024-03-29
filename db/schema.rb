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

ActiveRecord::Schema.define(version: 20150914120546) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "requests", force: :cascade do |t|
    t.string   "cmdr_name"
    t.string   "platform"
    t.integer  "system_id"
    t.boolean  "oxygen_timer"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "systems", force: :cascade do |t|
    t.integer  "api_id"
    t.string   "name"
    t.string   "x"
    t.string   "y"
    t.string   "z"
    t.string   "faction"
    t.string   "population"
    t.string   "government"
    t.string   "allegiance"
    t.string   "state"
    t.string   "security"
    t.string   "primary_economy"
    t.boolean  "needs_permit"
    t.string   "api_updated_at"
    t.string   "power_control_faction"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

end
