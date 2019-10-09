class CreateBirds < ActiveRecord::Migration[5.2]
  def change
    create_table :birds do |t|
      t.string :name
      t.string :color
      t.text :song

      t.timestamps
    end
  end
end
