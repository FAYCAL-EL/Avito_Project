class SessionsController < ApplicationController

  def new
    @titre ="Connexion"
  end
  def create
      if params.key?(:session)
        utilisateur = Utilisateur.find_by(email: params[:session][:email].downcase)
        if utilisateur && utilisateur.authenticate(params[:session][:password])
          log_in utilisateur
          redirect_to utilisateur
        else
          flash.now[:danger] = 'Adresse email ou mot de passe invalide'
          render 'new'
        end
      else
        flash.now[:danger] = 'Formulaire de connexion non valide'
        render 'new'
      end
  end
  
  def destroy 
    log_out
    redirect_to root_url
  end

end
