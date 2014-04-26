class SessionsController < ApplicationController
	def new
		if signed_in?
			redirect_to current_user
		end
  	end

  	def create
	  	user = User.find_by_email(params[:session][:email].downcase)
	  	if user && user.authenticate(params[:session][:password])
	    	sign_in user
	    	flash[:success]='Welcome!'
	        if session[:target_url]
	        	redirect_to session[:target_url]
				session[:target_url]=nil
			else
				redirect_to user
			end
	  	else
	  		flash[:danger] = 'Invalid email/password combination' # Not quite right!
		    render action:'new'
	    end

  	end

  	def destroy
    	sign_out
    	redirect_to root_url
  	end


end
