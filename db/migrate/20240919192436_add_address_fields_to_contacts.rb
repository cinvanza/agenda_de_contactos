class AddAddressFieldsToContacts < ActiveRecord::Migration[7.1]
  def change
    add_column :contacts, :street, :string
    add_column :contacts, :city, :string
    add_column :contacts, :state, :string
    add_column :contacts, :country, :string
    add_column :contacts, :postal_code, :string
  end
end
