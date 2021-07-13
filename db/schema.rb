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

ActiveRecord::Schema.define(version: 2021_07_13_053203) do

  create_table "cardios", force: :cascade do |t|
    t.string "name"
    t.string "intensity"
    t.integer "duration"
  end

  create_table "strengths", force: :cascade do |t|
    t.string "name"
    t.string "intensity"
    t.integer "duration"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
  end

  create_table "users_workouts", force: :cascade do |t|
    t.string "name"
    t.integer "users_id"
    t.integer "workouts_id"
    t.integer "total_duration"
    t.string "favorites"
  end

  create_table "workouts", force: :cascade do |t|
    t.string "name"
    t.string "workout_type"
    t.integer "yoga_id"
    t.integer "cardio_id"
    t.integer "strength_id"
  end

  create_table "yogas", force: :cascade do |t|
    t.string "name"
    t.string "intensity"
    t.integer "duration"
  end

end
