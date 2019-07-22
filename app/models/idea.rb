class Idea < ApplicationRecord
    validates(:title, presence: true, uniqueness: true, case_sensitive: false)
    validates(:description, presence: true)
    belongs_to :user, optional: true
  
  
    scope(:search, ->(query) { where("title ILIKE ?", "%#{query}%") })
    
    
end
