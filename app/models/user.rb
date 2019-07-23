class User < ApplicationRecord
    has_secure_password

    has_many :ideas, dependent: :nullify
    has_many :reviews, dependent: :nullify
    has_many :likes, dependent: :destroy
    has_many :liked_ideas, through: :likes, source: :idea
  
     has_secure_password
    
     VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  
     validates :email, presence: true, uniqueness: true, format: VALID_EMAIL_REGEX

     def full_name
        "#{first_name} #{last_name}".strip
      end
  
end
