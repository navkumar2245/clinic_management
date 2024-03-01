class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_clinic
    before_action :set_appointment, only: [:show, :edit, :update, :destroy, :mark_doctor, :mark_medicine, :mark_completed, :add_prescription, :save_prescription ]
  
    def index
      @appointments = @clinic.appointments
    end
  
    def show
    end
  
    def new
      @appointment = @clinic.appointments.build
      @doctors = @clinic.users.doctors
    end
  
    def create
      @appointment = @clinic.appointments.build(appointment_params)
      
      @appointment.user_id = current_user.id 

      if @appointment.save!
        redirect_to clinic_appointments_path(@clinic), notice: 'Appointment was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end

    def add_prescription
      respond_to do |format|
        format.html { render :layout => false }
      end
    end
  
    def update
      if @appointment.update(appointment_params)
        redirect_to clinic_appointments_path(@clinic), notice: 'Appointment was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @appointment.destroy
      redirect_to clinic_appointments_path(@clinic), notice: 'Appointment was successfully destroyed.'
    end
  
      # PATCH /clinics/:clinic_id/appointments/:id/mark_doctor
  def mark_doctor
    if @appointment.update(status: 'doctor')
      redirect_to clinic_appointment_path(@clinic, @appointment), notice: 'Appointment status was successfully updated to Doctor.'
    else
      render :show
    end
  end

  # PATCH /clinics/:clinic_id/appointments/:id/mark_medicine
  def mark_medicine
    if @appointment.update(status: 'medicine')
      redirect_to clinic_appointment_path(@clinic, @appointment), notice: 'Appointment status was successfully updated to Medicine.'
    else
      render :show
    end
  end

  # PATCH /clinics/:clinic_id/appointments/:id/mark_completed
  def mark_completed
    if @appointment.update(status: 'completed')
      redirect_to clinic_appointment_path(@clinic, @appointment), notice: 'Appointment status was successfully updated to Completed.'
    else
      render :show
    end
  end

  def save_prescription
    appointment = Appointment.find(params[:id])
    appointment.prescription_images.attach(io: StringIO.new(Base64.decode64(params[:prescription_data].split(',')[1])),filename: 'prescription_image.png')
    appointment.save
    render json: { success: true }
  end

    private
  
    def set_clinic
      @clinic = Clinic.find(params[:clinic_id] || current_user.clinic_id)
    end
  
    def set_appointment
      @appointment = @clinic.appointments.find(params[:id])
    end
  
    def appointment_params
      params.require(:appointment).permit(:patient_name, :appointment_time, :status, :email, :phone_number, :address, :doctor_id, :user_id)
    end
end
