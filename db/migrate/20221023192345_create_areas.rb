class CreateAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :areas do |t|
      t.string :type
      t.string :geoloc
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
