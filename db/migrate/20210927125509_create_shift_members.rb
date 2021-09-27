class CreateShiftMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :shift_members do |t|
      t.references :shift, foreign_key: true, unique: true
      t.references :user, foreign_key: true, unique: true

      t.timestamps
    end
  end
end
