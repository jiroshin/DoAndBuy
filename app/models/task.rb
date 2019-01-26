class Task < ApplicationRecord
  validates :goal, presence: true, length: { maximum: 200 }
  validates :deadline, presence: true
  validates :name, presence: true
  validates :url, presence: true, length: { maximum: 250 }
  validates :image_url, presence: true, length: { maximum: 250 }
  
  belongs_to :user
  has_many :comments
end
