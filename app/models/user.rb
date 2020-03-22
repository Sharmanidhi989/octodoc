class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist

  enum role: { doctor: 'Doctor', patient: 'Patient', admin: 'Admin' }
  has_many :appointments
  has_many :doctors_relations, foreign_key: :doctor_id, class_name: 'Appointment'
  has_many :patients, through: :doctors_relations

  has_many :patients_relations, foreign_key: :patient_id, class_name: 'Appointment'
  has_many :doctors, through: :patients_relations
end
