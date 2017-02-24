class Client < ApplicationRecord
  has_many :events, dependent: :destroy
  validates :chain, presence: true

  before_save do
    self.roles.gsub!(/[\[\]\"]/, "") if attribute_present?("roles")
  end
end
