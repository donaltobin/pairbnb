class ListingsController < ApplicationController
	before_action :require_login, only: :show

	def index #see every listings (w.o details)
	end

	def show # where u see details of each listing
	end
end
