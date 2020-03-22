class Appointment < ApplicationRecord
	belongs_to :doctor, class_name: 'User'
	belongs_to :patient, class_name: 'User'
  validate :paitient_cannot_be_doctors

  def paitient_cannot_be_doctors
    return unless doctor.patient? || doctor.admin?

    errors.add(:doctor, "is not eligible")
  end    
end
