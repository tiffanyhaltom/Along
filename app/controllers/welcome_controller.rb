class WelcomeController < ApplicationController
	 before_action :redirect_if_logged_out, only: [:index]

	def index
		@roadtrip = Roadtrip.new
	end

	private

	def redirect_if_logged_out
		if !current_user 
			redirect_to :login
		end
	end

end
