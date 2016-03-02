class ReservationsController < ApplicationController
	before_action :find_reservation, only: :destroy

	def new
		find_listing
		@reservation = Reservation.new
		gon.client_token = generate_client_token

		daterange = params[:daterange]
		daterange.gsub!(/(\d{2})\/(\d{2})\/(\d{4}).-.(\d{2})\/(\d{2})\/(\d{4})/,'\3-\1-\2 \6-\4-\5')
		reservdates = daterange.split(" ")
		@check_in = reservdates[0]
		@check_out = reservdates[1]
		@total_cost = total_amount_due
	end

	def create
		find_listing
		current_user
		@total_cost = total_amount_due
		@reservation = @listing.reservations.new(reservation_params)
		
		if @reservation.save
			flash.now[:success] = "Your reservation has been successful!"
			redirect_to root_path
			# redirect_to listing_reservation_path(@listing, @reservation)
		else 
			flash.now[:error] = "Your reservation could not be processed at this time. Please try again and make sure all your information is correct."
			redirect_to @listing
		end
	end

	def edit
		find_listing
		find_reservation

	end

	def update
		find_reservation
		find_listing
		if @reservation.update(reservation_params)
			redirect_to listing_reservation_path(@listing, @reservation), notice: "Reservation was successfully updated!"
		else 
			redirect_to 'edit'
		end
	end

	def show 
		find_reservation
		find_listing
	end

	def destroy
		@reservation.destroy
		redirect_to root_path
	end

	private

	def reservation_params
		params.require(:reservation).permit(:guests, :check_in, :check_out, :listing_id, :user_id, :amount)
	end

	def find_reservation 
		@reservation = Reservation.find(params[:id])
	end

	def find_listing
		@listing = Listing.find(params[:listing_id])
	end

	def total_amount_due

		nights = 8
		# nights = (@check_out.to_date - @check_in.to_date).to_i
		total_cost = @listing.price * nights
	end

	def generate_client_token
  		Braintree::ClientToken.generate
	end


end
