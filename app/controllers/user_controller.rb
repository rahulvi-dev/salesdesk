class UserController < ApplicationController

  before_filter :authenticate_user!, :except => [:show]

  def edit
  end

  def update_password
    user = current_user
    if current_user.update_attributes(user_params)
      sign_in user, :bypass => true
      flash[:notice] = I18n.t("general.password_updated_successfully")
      redirect_to edit_password_path
    else
      render "edit"
    end
  end

  def edit_profile    
  end
  
  def update_profile
    if current_user.update_attributes(edit_user_params)
      flash[:notice] = I18n.t("general.profile_updated_successfully")
      redirect_to edit_profile_path
    else
      render "edit_profile"
    end
  end

  def show
    @user = User.find params[:id]
    prepare_meta_tags title: @user.full_name, description: @user.role, keywords: @user.full_name
  end

  private

  def user_params
    # NOTE: Using `strong_parameters` gem
    params.require(:user).permit(:password, :password_confirmation)
  end

  def edit_user_params
    params.require(:user).permit(:first_name, :last_name, :avatar)
  end
end
