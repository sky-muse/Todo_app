class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.datetime :start_date
      t.datetime :scheduled_end_date
      t.datetime :end_date
      t.string :priority
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
