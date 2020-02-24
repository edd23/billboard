class SongsController < ApplicationController
  before_action :set_artist
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  def index
    @artist = Artist.find(params[:artist_id])
    @songs = @artist.songs
    binding.pry
  end

  def new
    @song = @artist.songs.new
    render partial: "form"
  end

  def show
  end

  def edit
    render partial: 'form'
  end

  def create
    @song = @artist.songs.new(song_params)

    if @song.save
      redirect_to [@artist, @song]

    else
      render :new
    end
  end

  def update
    if @song.update(song_params)
      redirect_to [@artist, @song]
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to artist_songs_path(@artist)
  end

  private
    def set_artist
      @artist = Artist.find(params[:artist_id])
    end

    def set_topic
      @song = Song.find(params[:id])
    end

    def topic_params
      params.require(:song).permit(:name, :body)
    end


end
