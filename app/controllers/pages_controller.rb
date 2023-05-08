class PagesController < ApplicationController
  def home
    @titre = "Annonces au Maroc"
    @annonce = utilisateur_courant.annonces.build if logged_in?
    @annonces = Annonce.all # assuming you have an `Annonce` model

  end

  def aide
    @title = "Aide"
  end

  def contact
    @title = "Contact"
  end

end
