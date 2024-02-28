class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         belongs_to :clinic
         has_many :appointments, foreign_key: 'user_id'
         has_many :doctor_appointments, class_name: 'Appointment', foreign_key: 'doctor_id'
         enum role: { doctor: 'doctor', receptionist: 'receptionist', medicine_maker: 'medicine_maker' }
         scope :doctors, -> { where(role: :doctor) }


end
