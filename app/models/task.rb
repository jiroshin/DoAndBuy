class Task < ApplicationRecord
  validates :goal, presence: true, length: { maximum: 200 }
  validates :deadline, presence: true
  validates :name, presence: true
  validates :url, presence: true, length: { maximum: 300 }
  validates :image_url, presence: true, length: { maximum: 300 }
  
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user
end
