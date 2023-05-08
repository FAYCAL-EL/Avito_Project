class AnnoncesController < ApplicationController
    before_action :authenticate, only: [:index, :show, :create, :update, :destroy]
    
    def index
        if params[:query].present?
          @annonces = Annonce.where("titre LIKE ?", "%#{params[:query]}%")
        else
          @annonces = Annonce.all
        end
    end
    
    def show
        @annonce = Annonce.find(params[:id])
    end
    
    def new
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
    