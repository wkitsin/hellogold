class Transaction < ApplicationRecord
  self.inheritance_column = :_type_disabled
  require 'securerandom'
  before_create :add_random_name
  validates :amount, presence: true,

  
  def add_random_name
    self.name = SecureRandom.hex
  end

end
