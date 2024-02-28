class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.references :clinic, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :doctor_id
      t.string :patient_name
      t.string :phone_number
      t.string :email
      t.string :address
      t.string :status
      t.string :prescription_image
      t.datetime :appointment_time
      t.timestamps
    end
  end
end
