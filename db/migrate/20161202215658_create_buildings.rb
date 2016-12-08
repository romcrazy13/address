class CreateBuildings < ActiveRecord::Migration[5.0]
  def change
    create_table :buildings do |t|
      t.string :number
      t.boolean :have_flet
      t.references :street, foreign_key: true

      t.timestamps
    end
  end
end
