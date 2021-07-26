class ConcertsController < ApplicationController
  before_action :set_concert, only: [:show, :update, :destroy]

  # GET /concerts
  def index
    concerts = Concert.all

    render json: ConcertSerializer.new(concerts).to_serialized_json
  end

  # GET /concerts/1
  def show
    render json: ConcertSerializer.new(@concert).to_serialized_json
  end

  # POST /concerts
  def create
    concert = Concert.new(concert_params)

    if concert.save
      render json: ConcertSerializer.new(concert).to_serialized_json
    else
      render json: concert.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /concerts/1
  def update
    if @concert.update(concert_params)
      render json: ConcertSerializer.new(@concert).to_serialized_json
    else
      render json: @concert.errors, status: :unprocessable_entity
    end
  end

  # DELETE /concerts/1
  def destroy
    @concert = Concert.all.find_by_id(params[:id])
    @concert.destroy
    render json: {message: "Concert successfully deleted"}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_concert
      @concert = Concert.find(params[:id])
      
    end

    # Only allow a list of trusted parameters through.
    def concert_params
      params.require(:concert).permit(:venue, :date, :city, :state, :artist_id)
    end
end
