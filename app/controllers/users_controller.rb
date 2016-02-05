class UsersController < ApplicationController
  skip_before_action :login_required
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params) # Not the final implementation!
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Beermon! Start Tasting 'Em All!"
      redirect_to @user
      # Handle a successful save.
    else
      render "new"
    end
  end
  
  def show
    @user = User.find(params[:id])
    @beers = @user.beers.paginate(page: params[:page], :per_page => 5)
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
