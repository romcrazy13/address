class Street < ApplicationRecord

  validates :street_name, presence: true

  belongs_to :town
  has_many   :buildings, dependent: :destroy

end
