class Destination < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, maximum: 30 }
  validates :city_name, presence: true, length: { minimum: 3, maximum: 30 }
  validates :description, presence: true, length: { minimum: 3, maximum: 250 }
  validates :image_url, presence: true, length: { minimum: 3 }
  validates :fee, presence: true, length: { minimum: 1, maximum: 10 }
end
