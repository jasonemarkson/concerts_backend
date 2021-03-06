class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :update, :destroy]

  # GET /artists
  def index
    artists = Artist.all

    # render json: artists, include: :concerts
    render json: ArtistSerializer.new(artists).to_serialized_json
  end

  # GET /artists/1
  def show
    # render json: @artist
    render json: ArtistSerializer.new(@artist).to_serialized_json
  end

  # POST /artists
  def create
    artist = Artist.new(artist_params)

    if artist.save
      render json: ArtistSerializer.new(artist).to_serialized_json
    else
      render json: artist.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /artists/1
  def update
    if @artist.update(artist_params)
      render json: ArtistSerializer.new(@artist).to_serialized_json
    else
      render json: @artist.errors, status: :unprocessable_entity
    end
  end

  # DELETE /artists/1
  def destroy
    @artist.destroy
    render json: {message: "Artist successfully deleted"}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def artist_params
      params.require(:artist).permit(:name)
    end
end
