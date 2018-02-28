class AuthController < ApplicationController
  before_action :authorize_user!, only: [:show]

   def show
     render json: current_user
   end

   def create
     user = User.find_by(user_name: params[:user_name])
     if user.present? && user.authenticate(params[:password])
       created_jwt = issue_token({id: user.id})
       serialized_user = ActiveModelSerializers::Adapter::Json.new(UserSerializer.new(user)).serializable_hash
       render json: {user: serialized_user, jwt: created_jwt}
     else
       render json: {
         error: 'Username or password incorrect'
       }, status: 404
     end
   end

   def sign_up
     @user = User.new(user_params)
     if @user.save
       created_jwt = issue_token({id: @user.id})
       render json: {user: @user, jwt: created_jwt}
     else
       render json: {errors: @user.errors.full_messages}, status: 422
     end
   end


   private

   def user_params
     params.require(:user).permit(
       :user_name,
       :first_name,
       :last_name,
       :password,
       :password_confirmation
     )
   end
end
