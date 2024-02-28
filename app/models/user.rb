class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         belongs_to :clinic, optional: true
         has_many :appointments, foreign_key: 'user_id'
         has_many :doctor_appointments, class_name: 'Appointment', foreign_key: 'doctor_id'
         enum role: { doctor: 0, receptionist: 1, medicine_maker: 2, admin: 3 }
         scope :doctors, -> { where(role: :doctor) }


end
