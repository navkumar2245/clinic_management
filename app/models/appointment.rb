class Appointment < ApplicationRecord
  belongs_to :clinic
  belongs_to :user, optional: true
  belongs_to :doctor, foreign_key: 'doctor_id', class_name: 'User'
  has_one :prescription
  enum status: { pending: 'pending', doctor: 'doctor',  medicine: 'medicine', completed: 'completed' }
end
