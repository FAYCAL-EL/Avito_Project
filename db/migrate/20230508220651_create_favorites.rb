class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.references :utilisateur, null: false, foreign_key: true
      t.references :annonce, null: false, foreign_key: true

      t.timestamps
    end
  end
end
