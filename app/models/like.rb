class Like < ApplicationRecord
  belongs_to :user
  belongs_to :idea


  # this will ensure that the campaign_id / user_id combo is unique
  # this is needed to ensure that the user can only like a campaign once.
  validates :user_id, uniqueness: {scope: :idea_id}
end
