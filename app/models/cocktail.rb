class Cocktail < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_one_attached :photo
  
  validates :name, presence: true
  validates :name, uniqueness: true
end
