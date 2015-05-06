class WelcomeController < ApplicationController

	def index
		@roadtrip = Roadtrip.new
	end

	def test
	end

end
