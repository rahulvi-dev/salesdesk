class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references :client, foreign_key: true
      t.date :planning_date
      t.date :event_date
      t.time :start_time
      t.time :end_time
      t.integer :no_of_rooms
      t.string :timms
      t.integer :time_per_customer
      t.float :price

      t.timestamps
    end
  end
end
