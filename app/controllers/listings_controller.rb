class ListingsController < ApplicationController
	before_action :require_login, only: :show
	before_action :find_listing, only: [:show, :edit, :update, :destroy]

	def index #see every listings (w.o details)
		@listings = Listing.all
	end

	def show # where u see details of each listing
	end

	def new
		@listing = Listing.new
	end

	def create
		byebug
		@listing = current_user.listings.new(listing_params)

		if @listing.save
			redirect_to @listing
		else
			render 'new'
		end
	end

	def destroy
		@listing.destroy
		redirect_to root_path
	end

	def edit
	end

	def update
		if @listing.update(listing_params)
			redirect_to @listing, notice: "Listing was successfully updated!"
		else 
			redirect_to 'edit'
		end
	end

	private

	def listing_params
		params.require(:listing).permit(:title, :street_address, :city, :country, :property_type, :number_of_guests, :number_of_bedrooms, :number_of_beds, :description, {avatars: []}, :price, :start, :end)
	end

	def find_listing
		@listing = Listing.find(params[:id])
	end
end

