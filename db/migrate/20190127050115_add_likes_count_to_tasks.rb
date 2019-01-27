class AddLikesCountToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :likes_count, :integer
  end
end
