class UsersController < Clearance::UsersController

	def show
	end

	def edit
	end

	def update
	end

	def new
    @user = User.new
    render template: "users/new"
  end

	def create
		
  	@user = user_from_params
    if @user.save
    	@user.update(avatar:  user_params['avatar'])
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end

  def index
  end

	private
	def user_from_params
		byebug
    email = user_params.delete(:email)
    password = user_params.delete(:password)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
    end
  end

	def user_params
		params.require(:user).permit(:email, :password, :avatar)
	end
end
