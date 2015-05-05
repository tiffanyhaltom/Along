class WelcomeController < ApplicationController

	def index
		@roadtrip = Roadtrip.new
	end


end
