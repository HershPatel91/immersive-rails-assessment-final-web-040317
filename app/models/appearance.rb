class Appearance < ApplicationRecord
  belongs_to :guest
  belongs_to :episode
  belongs_to :user

  include ActiveModel::Validations
  validates_with MyValidator

  
end
