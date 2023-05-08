class Utilisateur < ApplicationRecord
  has_many :annonces, dependent: :destroy 
  # Name validation
  validates :nom, presence: true, length: { maximum: 50 }

  # Email validation
  before_save { email.downcase! }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: URI::MailTo::EMAIL_REGEXP },
                    uniqueness: { case_sensitive: false }

  # Phone validation
  validates :phone, presence: true, numericality: true

  # City validation
  # validates :city, presence: true, format: { with: /\A[a-zA-Z ]+\z/,
  #                                            message: "ne doit contenir que des lettres" }
  validate :city_must_be_valid

  def city_must_be_valid
    errors.add(:city, "is invalid") unless Ville.exists?(id: self.city)
  end
  # validates :city, inclusion: { in: Ville.all.map(&:name), message: "is not a valid city" }

  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password                                                     
end
  