class TopController < ApplicationController
  def index
    @lists = List.where(user: current_user).order("created_at ASC")
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      redirect_to :root 
    else
      render action: :edit
    end
  end

  def edit
  end

  private 
    def user_params 
      params.require(:user).permit(:name)
    end
end
