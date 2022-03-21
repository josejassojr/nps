class Project < ApplicationRecord
  validates :title, presence: true

  has_many :people, dependent: :destroy
end
