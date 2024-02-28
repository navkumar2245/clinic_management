class ApplicationController < ActionController::Base
    protected

    def after_sign_in_path_for(resource)
      if resource.is_a?(User)
        if resource.doctor? || resource.receptionist? || resource.medicine_maker?
          # Redirect different types of users to their respective pages
          # For simplicity, assuming all users will be redirected to the same page
        
        return clinic_appointments_path(resource.clinic)
        else
         return clinics_path
        end
      end
  
      # Redirect other types of users to a default page
      super
    end
end
