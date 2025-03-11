class CreateWines < ActiveRecord::Migration[7.1]
  def change
    create_table :wines do |t|
      t.string :name
      t.string :wine_type
      t.integer :rating
      t.text :notes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
