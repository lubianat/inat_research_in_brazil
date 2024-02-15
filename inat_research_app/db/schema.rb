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

ActiveRecord::Schema[7.1].define(version: 2024_02_15_205711) do
  create_table "research_articles", force: :cascade do |t|
    t.string "doi"
    t.string "pmid"
    t.string "europe_pmc_url"
    t.boolean "about_brazil"
    t.boolean "from_brazilians"
    t.boolean "uses_inaturalist_prominently"
    t.text "title"
    t.text "authorString"
    t.text "authorList"
    t.text "journalInfo"
    t.integer "pubYear"
    t.string "pageInfo"
    t.text "abstractText"
    t.text "affiliation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
