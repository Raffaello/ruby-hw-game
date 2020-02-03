class Hand
    attr_reader :cards
    def initialize(cards)
        @cards = cards
    end

    def to_str
        cards.map{|card| card.to_str}.join(', ')
    end
end
