class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :destination, index: true
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
