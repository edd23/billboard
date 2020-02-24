class ArtistsController < ApplicationController
  before_action :set_artists, only: [:show, :edit, :update, :destroy]
  def index
    @artists = Artist.all
  end

  def show
  end

  def new
    @artist = Artist.new
  end
  
  def edit
    @artist = Artist.find(params[:id])
    
  end
  
  def create
    @artist = Artist.new(artists_params)
    
    if @artist.save
      redirect_to artists_path
    else
      render :new
    end
  end

  def update
    if @artist.update(artist_params)
      redirect_to @artist
    else
      render :edit
    end
  end

  def destroy
   @artists.destroy
   redirect_to artists_path
  end

  private
  def set_artists
    @artists = Artist.find(params[:id])
  end


  def artists_params
    params.require(:artist).permit(:full_name)
  end
end

