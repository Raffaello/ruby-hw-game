class Rules
    # @hand
    # def initialize(hand)
    #     @hand = hand
    # end
end

class Poker < Rules
    #include Comparable

    ### move in the hands as property pokerHand sub class to deal with the ranks.
    ### this class will use that one specific for comparison pokerHand
    ### for 2 use a method to grab the other with comparable (?)

    def rank2(hand1, hand2)
        hand1 <=> hand2
    end
end