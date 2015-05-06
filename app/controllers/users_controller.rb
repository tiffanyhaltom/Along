class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :destroy]
  before_action :change_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    
  end

  def new
   # @user = User.new
  end

  def edit
  end

  def current
    @user = current_user
  end
  
   def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        # @user.update!(user_params)
        flash[:success] = 'Your profile was created successfully!'
        format.html { redirect_to root_url }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        flash[:success] = "Your profile was successfully updated."
        format.html { redirect_to @user}
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def change_user
    if current_user != set_user
      flash[:danger] = "Sorry, you cant #{params[:action]} this user. Click this message to close it"
      redirect_to set_user
    end
  end

    def user_params
      params.require(:user).permit(:id, :name, :image_url, :uid, :provider)
    end
end