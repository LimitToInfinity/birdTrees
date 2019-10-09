class CreateBirdTrees < ActiveRecord::Migration[5.2]
  def change
    create_table :bird_trees do |t|
      t.references :bird, foreign_key: true
      t.references :tree, foreign_key: true

      t.timestamps
    end
  end
end
