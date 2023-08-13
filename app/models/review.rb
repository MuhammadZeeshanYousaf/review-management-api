class Review < ApplicationRecord
  belongs_to :business

  validates_numericality_of :rating, less_than_or_equal_to: 5


end
