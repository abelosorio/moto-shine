class CreateMotorcycleModels < ActiveRecord::Migration[5.0]
  def change
    create_table :motorcycle_models do |t|
      t.string :name
      t.references :motorcycle_make, foreign_key: true

      t.timestamps
    end
  end
end
