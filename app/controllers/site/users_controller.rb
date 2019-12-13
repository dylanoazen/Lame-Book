class Site::UsersController < ApplicationController
  before_action :password_verify, only: [:update]
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
  	@users = User.all.page
  end

  def new
  	@user = User.new
  end

   def register
    @user = User.new(params_user)
    if @user.save
      redirect_to feed_home_index_path, notice: "Usuario Criado com sucesso"
    else
      redirect_to feed_home_index_path
    end
 end

 def update
    if @user.update(params_user)
    	redirect_to feed_home_index_path, notice: "Usuario Atualizado com sucesso"
    else
    	render :edit
    end
  end


  def params_user
    params_user = params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :nick_name, :avatar)
  end

 def destroy
    if @user.destroy
      redirect_to site_welcome_index_path, notice: "Usuario deletado com sucesso"
    else
      render :index
    end
 end

  def password_verify
     if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
     params[:user].extract!(:password, :password_confirmation)
   end
 end

   def set_user
    @user = User.find(params[:id])
   end

end
