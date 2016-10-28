class Category < ApplicationRecord
  # Category: title(required)
  
  has_many :posts,dependent: :destroy
  validates :title, presence: true, uniqueness: true

end
