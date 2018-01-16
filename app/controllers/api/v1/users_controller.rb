class Api::V1::UsersController < Api::V1::BaseController

  def show
    @user = User.find_by(username: params[:username])
  end
end
