class CreateImportantDates < ActiveRecord::Migration[7.1]
  def change
    create_table :important_dates do |t|
      t.date :date
      t.string :label
      t.references :contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end
