class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_variables

  def like
    like = current_user.likes.new(task_id: @task.id)
    like.save
  end

  def unlike
    like = current_user.likes.find_by(task_id: @task.id)
    like.destroy
  end

  private

  def set_variables
    @task = Task.find(params[:task_id])
  end
end
