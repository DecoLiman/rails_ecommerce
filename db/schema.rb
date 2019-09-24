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

ActiveRecord::Schema.define(version: 20170708190550) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "order_id",          limit: 4
    t.integer  "product_id",        limit: 4
    t.integer  "quantity",          limit: 4
    t.integer  "item_price_cents",  limit: 4
    t.integer  "total_price_cents", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "line_items", ["order_id"], name: "index_line_items_on_order_id", using: :btree
  add_index "line_items", ["product_id"], name: "index_line_items_on_product_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "total_cents",      limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "stripe_charge_id", limit: 255
    t.string   "email",            limit: 255
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.string   "image",       limit: 255
    t.integer  "price_cents", limit: 4
    t.integer  "quantity",    limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "category_id", limit: 4
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "product_id",  limit: 4
    t.integer  "user_id",     limit: 4
    t.text     "description", limit: 65535
    t.integer  "rating",      limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "firstname",       limit: 255
    t.string   "lastname",        limit: 255
  end

  add_foreign_key "line_items", "orders"
  add_foreign_key "line_items", "products"
  add_foreign_key "products", "categories"
end
