class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]


  def edit 

  end

  def update 
    if @user.update(user_params)
      redirect_to :root
    else
      render action: :edit
    end

  end

  private 
    def user_params
      params.require(:user).permit(:name)
    end

    def set_user 
      @user = User.find_by(id: params[:id])
    end

end
