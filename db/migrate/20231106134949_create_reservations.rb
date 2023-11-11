class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :destination, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.references :destination, foreign_key: true

      t.timestamps
    end
  end
end
