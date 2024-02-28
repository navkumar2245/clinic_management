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

ActiveRecord::Schema[7.1].define(version: 2024_02_28_054916) do
  create_table "appointments", force: :cascade do |t|
    t.integer "clinic_id", null: false
    t.integer "user_id", null: false
    t.integer "doctor_id"
    t.string "patient_name"
    t.string "phone_number"
    t.string "email"
    t.string "address"
    t.string "status"
    t.string "prescription_image"
    t.datetime "appointment_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clinic_id"], name: "index_appointments_on_clinic_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "clinics", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventory_items", force: :cascade do |t|
    t.integer "clinic_id", null: false
    t.string "medicine_name"
    t.integer "quantity"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clinic_id"], name: "index_inventory_items_on_clinic_id"
  end

  create_table "prescriptions", force: :cascade do |t|
    t.text "content"
    t.integer "appointment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appointment_id"], name: "index_prescriptions_on_appointment_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role"
    t.integer "clinic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "appointments", "clinics"
  add_foreign_key "appointments", "users"
  add_foreign_key "inventory_items", "clinics"
  add_foreign_key "prescriptions", "appointments"
end
