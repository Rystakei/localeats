class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.string :input
      t.string :result

      t.timestamps
    end
  end
end
