class AppearancesController < ApplicationController

  def new
    @appearance = Appearance.new
  end

  def create
    @appearance = Appearance.new(appearance_params)
    @user = User.find(session[:user_id])
    @appearance.user = @user
    byebug
    if @appearance.save
      redirect_to @appearance.episode
    else
      redirect_to new_appearance_path
      flash[:notice] = "Need a rating between 1 and 5!"
    end
  end

  def edit
    @appearance = Appearance.find(params[:id])
  end

  def update
     @appearance = Appearance.find(params[:id])
    if @appearance.save
      @appearance.update(rating: params[:appearance][:rating])
      redirect_to @appearance.episode
    else
      redirect_to edit_appearance_path
    end
  end

  private

  def appearance_params
    params.require(:appearance).permit(:guest_id, :episode_id, :rating)
  end

end