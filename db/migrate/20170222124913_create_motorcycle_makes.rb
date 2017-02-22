class CreateMotorcycleMakes < ActiveRecord::Migration[5.0]
  def up
    create_table :motorcycle_makes do |t|
      t.string :name, presence: true

      t.timestamps
    end

    # name must be required
    execute <<-SQL
      ALTER TABLE #{MotorcycleMake.table_name}
        ALTER COLUMN name
          SET NOT NULL;
    SQL

    # name must be unique (in case insensitive way)
    execute <<-SQL
      CREATE UNIQUE INDEX #{MotorcycleMake.table_name}_name_unique_index
        ON #{MotorcycleMake.table_name} (LOWER(name));
    SQL

    # name must contains only letter, numbers and spaces, and have a length
    # greater or equal than 3, and start with a letter.
    execute <<-SQL
      ALTER TABLE #{MotorcycleMake.table_name}
        ADD CONSTRAINT #{MotorcycleMake.table_name}_name_format_check
        CHECK (name ~ '^([a-zA-Z][a-zA-Z0-9[:space:]]{2,})$');
    SQL
  end

  def down
    # Drop INDEX(es) in cascade
    drop_table :motorcycle_makes
  end
end
