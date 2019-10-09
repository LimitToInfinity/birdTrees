class CreateTrees < ActiveRecord::Migration[5.2]
  def change
    create_table :trees do |t|
      t.string :species
      t.boolean :evergreen

      t.timestamps
    end
  end
end
