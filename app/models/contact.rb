class Contact < ApplicationRecord
  
  belongs_to :user
  has_many :phone_numbers, dependent: :destroy
  has_many :emails, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :important_dates, dependent: :destroy
end
