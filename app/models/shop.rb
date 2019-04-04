class Shop < ApplicationRecord

  validates :name, presence: true
  has_many :books
  has_many :publishers, through: :books

end
