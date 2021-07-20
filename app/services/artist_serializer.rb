class ArtistSerializer
    def initialize(artist_object)
        @artist = artist_object
    end

    def to_serialized_json
        @artist.to_json(:include => 
            {:concerts => {:except => [:created_at, :updated_at]}}, 
            :except => [:created_at, :updated_at]
        )
    end
end