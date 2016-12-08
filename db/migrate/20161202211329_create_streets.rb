class CreateStreets < ActiveRecord::Migration[5.0]
  def change
    create_table :streets do |t|
      t.string :street_name
      t.references :town, foreign_key: true

      t.timestamps
    end
  end
end
