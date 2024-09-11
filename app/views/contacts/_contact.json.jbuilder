json.extract! contact, :id, :first_name, :last_name, :company, :main_email, :main_phone, :address, :latitude, :longitude, :user_id, :created_at, :updated_at
json.url contact_url(contact, format: :json)
