class RemoveMainPhoneFromContacts < ActiveRecord::Migration[7.1]
  def change
    remove_column :contacts, :main_phone, :string
  end
end

