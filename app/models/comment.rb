class Comment < ApplicationRecord
  # Comment: body (required & unique per blog post)
  
  belongs_to :user
  belongs_to :post
  validates :body, presence: true

end
