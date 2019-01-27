class Comment < ApplicationRecord
  validates :content, presence: true, length: { maximum: 400 }
  
  belongs_to :user
  belongs_to :task
end
