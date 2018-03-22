class CreateNotebooks < ActiveRecord::Migration[5.1]
  def change
    create_table :notebooks do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :lecture, foreign_key: true
      t.string :title
      t.string :content
      t.string :video_id


      t.timestamps
    end
  end
end
