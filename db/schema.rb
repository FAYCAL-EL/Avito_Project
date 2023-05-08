# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_05_08_031130) do

  create_table "annonces", force: :cascade do |t|
    t.string "titre"
    t.text "description"
    t.integer "prix"
    t.string "categorie"
    t.string "ville"
    t.string "secteur"
    t.string "adresse"
    t.string "Etat"
    t.integer "utilisateur_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["utilisateur_id"], name: "index_annonces_on_utilisateur_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "titre"
    t.text "description"
    t.integer "prix"
    t.string "categorie"
    t.string "ville"
    t.string "secteur"
    t.string "adresse"
    t.string "Etat"
    t.integer "utilisateur_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["utilisateur_id"], name: "index_articles_on_utilisateur_id"
  end

  create_table "utilisateurs", force: :cascade do |t|
    t.string "nom"
    t.string "email"
    t.integer "phone"
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.boolean "admin", default: false
  end

  create_table "villes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "annonces", "utilisateurs"
  add_foreign_key "articles", "utilisateurs"
end
