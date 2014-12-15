class SessionsController < ApplicationController

  def new
  end

	def create
    	user = User.from_omniauth(env["omniauth.auth"], params[:rank])
		if (session[:user_id].nil?) # => wasn't previously logged in
			session[:user_id] = user.uid  # => session id = newly created user's id
			if (user.rank == "admin")
				redirect_to admins_path, notice: "Signed In!"
			else
				redirect_to root, notice: "Failed attempt to sign in" 
			end
		else
			if (User.count == 1)
				#redirect_to "/admins/identities/#{user.uid}", notice: "User created!"
				redirect_to "/signout"
			elsif (current_user.rank = "admin")
				redirect_to "/admins/identities/#{user.uid}", notice: "User created!"
			else
				redirect_to root_url, notice: "Student Signed in Successfully!"
			end

		end
		#session[:user_id] ||= user.uid
		#redirect_to appointments_path, notice: "Signed in!"
	end

	def destroy
        session[:user_id] = nil
        redirect_to root_url notice: "Signed out!"
	end

	def failure
        redirect_to root_url, alert: "Authentication failed, please try again."
	end

end
