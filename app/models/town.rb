class Town < ApplicationRecord

  validates :town_name, presence: true,
                        uniqueness: { case_sensitive: false }

  has_many :streets, dependent: :destroy

end
