class AnnoncesController < ApplicationController
    before_action :authenticate, only: [:index, :show, :create, :update, :destroy]
    
    def index
        
        if params[:query].present? && params[:city].present?
          @annonces = Annonce.where("titre LIKE ? AND ville LIKE ?", "%#{params[:query]}%", params[:city])
        elsif params[:query].present?
          @annonces = Annonce.where("titre LIKE ?", "%#{params[:query]}%")
        elsif params[:city].present?
          @annonces = Annonce.where("ville LIKE ?", params[:city])
        else
          @annonces = Annonce.all
        end
    end
    
    def show
       
        @annonce = Annonce.find(params[:id])
        @titre = @annonce.titre
        @utilisateur = @annonce.utilisateur
    end
    
    def new
        @titre = "Ajouter une annonce"
        @annonce = Annonce.new
    end
    
    def create
        @annonce = utilisateur_courant.annonces.build(annonce_params)
        if @annonce.save
        redirect_to @annonce
        else
        render 'new'
        end
    end
    
    def edit
        @titre = "Modifier votre annonce"
        @annonce = Annonce.find(params[:id])
    end
    
    def update
        @annonce = Annonce.find(params[:id])
        if @annonce.update(annonce_params)
        redirect_to @annonce
        else
        render 'edit'
        end
    end
    
    def destroy
        Annonce.find(params[:id]).destroy
        redirect_to annonces_url
    end
    
    private
    
    def annonce_params
        params.require(:annonce).permit(:titre, :description, :prix, :categorie, :ville, :secteur, :adresse, :Etat, :image)
    end
end
    