class Campaign < ApplicationRecord
  belongs_to :user

  has_many :characters, dependent: :destroy
  validates :title, presence: true
  validates :description, presence: true
end
