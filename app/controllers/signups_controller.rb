class SignupsController < ApplicationController
    def new 
        @signup = Signup.new
        @errors = flash[:errors]
    end

    def create 
        @signup = Signup.create(signup_params)
        if @signup.valid?
            # redirect_to camper_path(@signup.camper.id)
            redirect_to activity_path(@signup.activity)
        else
            flash[:errors] = @signup.errors.full_messages
            redirect_to new_signup_path
        end
    end

    def signup_params
        params.require(:signup).permit(:camper_id, :activity_id, :time)
    end
end
