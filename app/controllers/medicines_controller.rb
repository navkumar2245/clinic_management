class MedicinesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_clinic

    def index
       @medicines = @clinic.medicines
    end
    private
  
    def set_clinic
      @clinic = Clinic.find(params[:clinic_id] || current_user.clinic_id)
    end
end
