class Idea < ApplicationRecord
    validates(:title, presence: true, uniqueness: true, case_sensitive: false)
    validates(:description, presence: true)
    belongs_to :user, optional: true

    has_many :reviews, dependent: :destroy 
    has_many :likes, dependent: :destroy
  
    has_many :likers, through: :likes, source: :user
    
    scope(:search, ->(query) { where("title ILIKE ?", "%#{query}%") })
    
    
end
