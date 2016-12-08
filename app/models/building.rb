class Building < ApplicationRecord

  validates :number, presence: true
  validates :have_flet, inclusion: { in: [true, false] }

  belongs_to :street

end
