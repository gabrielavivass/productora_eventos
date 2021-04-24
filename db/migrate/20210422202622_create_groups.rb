class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :members
      t.integer :group_type

      t.timestamps
    end
  end
end
