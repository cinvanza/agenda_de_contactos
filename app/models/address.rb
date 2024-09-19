class Address < ApplicationRecord
  belongs_to :contact

  geocoded_by :full_address
  after_validation :geocode, if: -> { will_save_change_to_street? || will_save_change_to_city? || will_save_change_to_state? || will_save_change_to_country? || will_save_change_to_postal_code? }

  def full_address
    [street, city, state, country, postal_code].compact.join(', ')
  end
end
