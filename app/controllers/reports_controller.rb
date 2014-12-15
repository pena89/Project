require 'csv'

class ReportsController < AdminsController

	def index
		@reports = nil
		

	    @all_users = params[:user_names] || session[:user_names] || {}

	
	   	year = params[:date_year].to_i  #was commentted out in patbranch	
        month = params[:date_month].to_i #was commentted out in patbranch
		@years = (Date.parse("2014-01-01").year..Time.now.year).to_a #array of year numbers [2001, 2002, etc]
		@months = (1..12).to_a

	end

	def new
		@all_users = []
		User.all.each do |user|
			@all_users << user.name
		end
	end



	def export

	  type = params[:report_type]
	  user_names = ["Date"]
	

	  output = [].to_csv
	
	  if (type == "Weekly Report" || type == "Both")
	    output << [ "Weekly Report" ].to_csv
	    output << school_names.to_csv
	    rows = Appointment.getHoursReport2DArray( params[:start_month].to_i, params[:start_year].to_i, params[:end_month].to_i, params[:end_year].to_i).to_a
	    rows.each do |row|
	      output << row
	    end
	  end

	  if (type == "Monthly Report" || type == "Both")
            if (type == "Both")
	      output << [].to_csv
	      output << [].to_csv
	    end
	    output << [ "Monthly Report" ].to_csv
	    output << user_names.to_csv
	    rows = Appointment.getNumPeopleReport2DArray( params[:start_month].to_i, params[:start_year].to_i, params[:end_month].to_i, params[:end_year].to_i).to_a
	    rows.each do |row|
	      output << row
	    end
	  end

      	  send_data output, :type => "text/csv", :filename => "MathLabReports_#{type}_#{Time.now.strftime('%b-%d-%Y')}.csv"

	   
	end
	
	def getHoursReport2DArray
		Appointment.getHoursReport2DArray(@all_users, params[:start_month], params[:start_year], params[:end_month], params[:end_year])
	end

	def getNumPeopleReport2DArray
		Appointment.getNumPeopleReport2DArray(@all_users, params[:start_month], params[:start_year], params[:end_month], params[:end_year])
	end

end
