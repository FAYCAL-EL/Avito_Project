require "test_helper"

class UtilisateurTest < ActiveSupport::TestCase
  def setup
    @utilisateur = Utilisateur.new(nom: "prenom1 Nom1",
                                   email: "prenom1@example.com",
                                   phone: "1234567890",
                                   city: "Agadir",
                                   password: "aaaaaaa",
                                   password_confirmation: "aaaaaaa")
  end
  #! nom
  test "nom doit etre present" do
    @utilisateur.nom = ""
    assert_not @utilisateur.valid?
  end
  test "nom ne doit pas être trop long" do
    @utilisateur.nom = "a" * 51
    assert_not @utilisateur.valid?
  end
  #! email
  test"email doit etre present" do
    @utilisateur.email = ""
      assert_not @utilisateur.valid?
  end
	#length validation
  test"email ne doit pas etre trop long" do
    @utilisateur.email = "a" * 244 + "@exemple.com"
      assert_not @utilisateur.valid?
  end
  test "email doit être unique" do
    duplicate_utilisateur = @utilisateur.dup
    duplicate_utilisateur.email = @utilisateur.email.upcase
    @utilisateur.save
    assert_not duplicate_utilisateur.valid?
  end
  #! phone 
  test "phone ne doit pas être vide" do
    @utilisateur.phone = ""
    assert_not @utilisateur.valid?
  end
  test "phone ne doit pas contenir de lettres" do
    @utilisateur.phone = "abc123"
    assert_not @utilisateur.valid?
  end
  #! city
  test "city ne doit pas être vide" do
    @utilisateur.city = ""
    assert_not @utilisateur.valid?
  end
  
  test "city ne doit pas contenir de chiffres" do
    @utilisateur.city = "New York 123"
    assert_not @utilisateur.valid?
  end




end
