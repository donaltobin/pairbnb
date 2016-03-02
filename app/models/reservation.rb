class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :listing

	validates :check_in, presence: true
  validates :check_out, presence: true	

end
