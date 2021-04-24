class CreateConcerts < ActiveRecord::Migration[5.2]
  def change
    create_table :concerts do |t|
      t.integer :public
      t.integer :duration
      t.date :concert_date
      t.integer :group_id
      t.belongs_to :group, foreign_key: true

      t.timestamps
    end
  end
end
