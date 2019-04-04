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

ActiveRecord::Schema.define(version: 20190403145122) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.integer "composition_id"
    t.integer "publisher_id"
    t.integer "shop_id"
    t.boolean "sold", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["composition_id"], name: "index_books_on_composition_id"
    t.index ["publisher_id", "shop_id"], name: "index_books_on_publisher_id_and_shop_id"
    t.index ["shop_id", "publisher_id"], name: "index_books_on_shop_id_and_publisher_id"
    t.index ["sold"], name: "index_books_on_sold"
  end

  create_table "compositions", force: :cascade do |t|
    t.string "author"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author"], name: "index_compositions_on_author"
    t.index ["name"], name: "index_compositions_on_name"
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_publishers_on_name"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_shops_on_name"
  end

end
