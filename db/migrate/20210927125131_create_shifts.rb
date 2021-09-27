class CreateShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :shifts do |t|
      t.string :name
      t.integer :days, array: true

      t.timestamps
    end
  end
end
