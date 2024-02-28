class UsersController < ApplicationController
    before_action :set_clinic

    def new
      @user = @clinic.users.build
    end
  
    def create
      @user = @clinic.users.build(user_params)
      if @user.save
        redirect_to clinic_path(@clinic), notice: 'User was successfully created.'
      else
        render :new
      end
    end
  
    private
    def set_clinic
        @clinic = Clinic.find(params[:clinic_id])
      end
    
      def user_params
        params.require(:user).permit(:email, :password, :role)
      end
  end
  