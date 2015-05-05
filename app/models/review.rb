class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :check_in
end
