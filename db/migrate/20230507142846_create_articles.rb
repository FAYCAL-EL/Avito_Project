class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :titre
      t.text :description
      t.integer :prix
      t.string :categorie
      t.string :ville
      t.string :secteur
      t.string :adresse
      t.string :Etat
      t.references :utilisateur, null: false, foreign_key: true

      t.timestamps
    end
  end
end
