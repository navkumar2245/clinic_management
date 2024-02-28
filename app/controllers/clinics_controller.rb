class ClinicsController < ApplicationController
    before_action :authenticate_user!

    before_action :set_clinic, only: [:show, :edit, :update, :destroy]
    
    def index
      @clinics = Clinic.all
    end
  
    def show
    end
  
    def new
      @clinic = Clinic.new
    end
    
    def edit
    end
    
    def update
    end

    def destroy
        if @clinic.destroy
            redirect_to @clinic, notice: 'Clinic was successfully deleted.'
        else
            redirect_to @clinic, notice: 'Clinic was not deleted.'
        end
    end
  
    def create
      @clinic = Clinic.new(clinic_params)
      if @clinic.save
        create_default_user_for_clinic(@clinic)
        redirect_to @clinic, notice: 'Clinic was successfully created.'
      else
        render :new
      end
    end
  
    private
      def set_clinic
        @clinic = Clinic.find(params[:id])
      end
  
      def clinic_params
        params.require(:clinic).permit(:name, :location)
      end
  
      def create_default_user_for_clinic(clinic)
        clinic.users.create(email: "admin@#{clinic.name.parameterize}.com", password: 'password', role: :admin)
      end
  end
  