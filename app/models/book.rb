class Book < ApplicationRecord
  has_many :reviews

  def average_review
    sum = 0
    reviews.each do |review|
      sum += review.rating
    end
    sum.to_f / reviews.count
  end
end
