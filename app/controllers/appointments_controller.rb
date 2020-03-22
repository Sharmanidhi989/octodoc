class AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @appointments = current_user.appointments
    respond_to do |format|
      format.json { render json: @appointments }
    end
  end

  # for the time being user can only create appoinments and not delete or update them.
  def create
    @appointment = cuurent_user.appointments.build(appointment_params)
    respond_to do |format|
      if @appointment.save
        format.json { render json: @appointment}
      else
        format.json { render json: @appointment.errors }
      end
    end
  end

  def fetch_doctors
    @doctors = cuurent_user.doctors
    respond_to do |format|
      format.json { render json: @doctors }
    end
  end

  def fetch_patients
    @patients = cuurent_user.patients
    respond_to do |format|
      format.json { render json: @patients }
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :scheduled_at)
  end
end
