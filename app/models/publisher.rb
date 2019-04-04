class Publisher < ApplicationRecord

  validates :name, presence: true
  has_many :books
  has_many :shops, through: :books

end
