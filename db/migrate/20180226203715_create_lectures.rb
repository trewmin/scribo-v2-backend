class CreateLectures < ActiveRecord::Migration[5.1]
  def change
    create_table :lectures do |t|
      t.integer :admin_id
      t.string :title
      t.datetime :date_time

      t.timestamps
    end
  end
end
