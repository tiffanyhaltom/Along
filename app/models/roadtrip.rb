class Roadtrip < ActiveRecord::Base
	belongs_to :user
	has_many :check_ins
	validates_presence_of :user_id, :origin, :destination, :name

end
