class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  #google login
  def sign_in
    @user = User.find_by_email(params[:email])
    
    if @user
      @user.update(user_params)
    else
      @user = User.new(user_params)
      @user.save
    end

    auth_token = Knock::AuthToken.new payload: {sub: @user.id}
    render json: {name: @user.name, jwt: auth_token.token, imageUrl: @user.imageUrl, email: @user.email}
  end

  def sign_out
    @user = User.find_by_email(params[:email])
    render json: {action: "sign_out", email: @user.email}
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :name, :googleId, :password, :imageUrl, :familyName, :givenName)
    end
end
