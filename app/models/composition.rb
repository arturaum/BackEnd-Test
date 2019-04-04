class Composition < ApplicationRecord

  validates :author, :name, presence: true
  has_many :books

end
