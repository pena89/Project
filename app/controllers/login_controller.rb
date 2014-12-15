class LoginController < ApplicationController
	def index
	  	if not current_user.nil?
		  	if @current_user.rank == "admin"
		 		redirect_to "/admins"
	        end
	        if @current_user.rank == "participant"		
		 		redirect_to root_url
				flash[:notice] = "Good try."
		 	end
		else
			if !admin_exists #not logged in and no admin exists yet => redicirect to login page
				flash[:notice] = "No admin account exists.  Please create a new admin account."
				flash.keep
				redirect_to "/admins/identities/new", notice: "No admin account exists.  Please create a new admin account."
			end
		end
	end
end
