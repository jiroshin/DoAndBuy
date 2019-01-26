class UsersController < ApplicationController
  def show
    @user = User.find(params[:format])
    @tasks = @user.tasks.order('created_at DESC').page(params[:page]).per(3)
  end
end
