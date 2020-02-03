require 'hand'

class Deck
    attr_reader :seed
    @head
    def initialize(seed = 0)
        @seed = seed
        @cards = Array(0..51).shuffle(random: Random.new(@seed))
        @head = 0
    end

    def pickCard()
        if (@head >= 52) 
            nil
        else 
            @head = @head + 1
            Card.new(@cards[@head - 1])
        end
    end

    def pickOneHand(cards = 5)
        @cards = Array(1..cards).map{ |i| pickCard() }
        PokerHand.new(@cards)
    end
    
end
