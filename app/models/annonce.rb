class Annonce < ApplicationRecord
  belongs_to :utilisateur

    
  validates :utilisateur_id, presence: true
  validates :titre, presence: true, length: { maximum: 200 }
  validates :description, presence: true, length: { maximum: 20000 }
  validates :prix, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :categorie, presence: true
  validates :ville, presence: true
  validates :secteur, presence: true
  validates :adresse, presence: true
  validates :Etat, presence: true
end
