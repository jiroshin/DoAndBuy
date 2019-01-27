class Like < ApplicationRecord
  belongs_to :user
  belongs_to :task, counter_cache: :likes_count
end
