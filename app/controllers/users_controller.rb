class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find(params[:format])
    @tasks = @user.tasks.order('created_at DESC').page(params[:page]).per(3)
    @like_tasks = @user.like_tasks.order('created_at DESC').page(params[:page]).per(3)
  end
end
