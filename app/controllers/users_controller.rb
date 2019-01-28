class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id])
    @tasks = @user.tasks.order('created_at DESC').page(params[:page]).per(3)
    @like_tasks = @user.like_tasks.order('created_at DESC').page(params[:page]).per(3).uniq
  end
end
