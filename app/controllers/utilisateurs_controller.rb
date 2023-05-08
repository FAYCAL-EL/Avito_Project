class UtilisateursController < ApplicationController


  # before_action :bon_utilisateur, only: [:edit, :update]
  before_action :authenticate, only: [:index, :edit, :update, :destroy]
  	

  def index
    @utilisateurs = Utilisateur.all
  end
  def new
    @utilisateur = Utilisateur.new
  end
  def show
    @utilisateur = Utilisateur.find(params[:id])
    @annonces = @utilisateur.annonces 
  end
#! create 
  def create
    @utilisateur = Utilisateur.new(utilisateur_params)
    if @utilisateur.save
      flash[:success] = "Bienvenue!"
      redirect_to @utilisateur
    else
      render 'new'
    end
  end

#! edit  utlisateur
  def edit
    @utilisateur = Utilisateur.find(params[:id])
    @utilisateur_courant = utilisateur_courant
  end
#! update utlisateur
  def update
    @utilisateur = Utilisateur.find(params[:id])
    if @utilisateur.update(utilisateur_params)
      flash[:success] = "Profile Actualisé!"
      redirect_to @utilisateur
    else
      render 'edit'
    end
  end
#! destroy session utilisateur
  def destroy
    Utilisateur.find(params[:id]).destroy
    flash[:success] = "Utilisateur supprimé"
    # log_out if logged_in?
    redirect_to root_url
  end

  #! prevent unauthorized modification of user roles throw F12 for example
  private
  def utilisateur_params
    params.require(:utilisateur).permit(:nom, :email, :phone, :city, :password, :password_confirmation)
  end



  def authenticate
    unless logged_in?
      flash[:danger] = "Merci de se connecter."
    redirect_to login_url
    end
  end

  def bon_utilisateur
    # puts "params[:id]: #{params[:id]}"
    # puts "@utilisateur_courant.id: #{@utilisateur_courant.id}"
    @utilisateur = Utilisateur.find(params[:id])
    redirect_to(root_url) unless @utilisateur == utilisateur_courant 
  end

end
