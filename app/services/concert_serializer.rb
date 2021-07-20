class ConcertSerializer
    def initialize(concert_object)
        @concert = concert_object
    end

    def to_serialized_json
        @concert.to_json(:include => {:artist => {:except => [:created_at, :updated_at]}},
        :except => [:created_at, :updated_at]
        )
    end
end