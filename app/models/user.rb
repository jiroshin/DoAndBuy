class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :tasks
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_tasks, through: :likes, source: :task
end
