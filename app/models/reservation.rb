class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :destination

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :user, presence: true
  validates :destination, presence: true
end
