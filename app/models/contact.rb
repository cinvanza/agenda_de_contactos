class Contact < ApplicationRecord
  belongs_to :user
  has_many :phone_numbers, dependent: :destroy
  has_many :emails, dependent: :destroy
  has_many :important_dates, dependent: :destroy

  accepts_nested_attributes_for :phone_numbers, allow_destroy: true

  geocoded_by :full_address
  after_validation :geocode, if: -> { will_save_change_to_address? }

  def full_address
    [address].compact.join(', ')
  end
end
