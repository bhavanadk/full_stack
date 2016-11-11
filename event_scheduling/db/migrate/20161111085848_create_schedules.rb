class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :title
      t.string :venue
      t.string :date
      t.string :time
      t.string :description
      t.string :invitees
      t.string :status
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
