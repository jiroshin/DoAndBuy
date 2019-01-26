class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.references :user, foreign_key: true
      t.text :goal
      t.date :deadline
      t.string :code
      t.string :name
      t.string :url
      t.string :image_url

      t.timestamps
    end
  end
end
