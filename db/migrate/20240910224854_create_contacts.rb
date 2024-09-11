class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :main_email
      t.string :main_phone
      t.string :address
      t.float :latitude
      t.float :longitude
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
