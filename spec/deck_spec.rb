require "deck"

describe Deck do
    context "Initialze a Deck seed 0" do
        it "Should return first card  AA" do
            deck = Deck.new(0)
            card = deck.pickCard()
            expect(card.to_str).to eq "4H"
        end
        it "should return nil when no more cards (all picked up)" do
            deck = Deck.new(0)
            for i in 1..52 do
                deck.pickCard()
            end
            card = deck.pickCard()
            expect(card).to eq nil
        end

        it "should return a hand of 4H, KH, KC, TH, 4C" do
            deck = Deck.new(0)
            hand = deck.pickOneHand(5)
            expect(hand.to_str).to eq "4H, KH, KC, TH, 4C"
        end
    end
end
