require 'poker'

describe Poker do
    context "2 hands" do
        it "should high card tie" do
            cards = [0,14,36,28, 29].map{ |i|Card.new(i) }
            pokerHand = PokerHand.new(cards)
            poker = Poker.new()
            expect(poker.rank2(pokerHand, pokerHand)).to eq 0
        end
        it "should high card win p1" do
            cards = [0,15,36,28, 29].map{ |i|Card.new(i) }
            cards2 = [0,14,36,28, 29].map{ |i|Card.new(i) }
            pokerHand1 = PokerHand.new(cards)
            pokerHand2 = PokerHand.new(cards2)
            poker = Poker.new()
            expect(poker.rank2(pokerHand1, pokerHand2)).to eq 1
        end
        it "should high card loose p1" do
            cards = [0,15,36,28, 29].map{ |i|Card.new(i) }
            cards2 = [0,14,36,28, 29].map{ |i|Card.new(i) }
            pokerHand1 = PokerHand.new(cards)
            pokerHand2 = PokerHand.new(cards2)
            poker = Poker.new()
            expect(poker.rank2(pokerHand2, pokerHand1)).to eq -1
        end
        it "should pair tie" do
            cards = [0,13,36,28,29].map{ |i|Card.new(i) }
            pokerHand = PokerHand.new(cards)
            poker = Poker.new()
            expect(poker.rank2(pokerHand, pokerHand)).to eq 0
        end
        it "should pair tie win p1" do
            cards = [0,13,37,28, 29].map{ |i|Card.new(i) }
            cards2 = [0,13,36,28, 29].map{ |i|Card.new(i) }
            pokerHand1 = PokerHand.new(cards)
            pokerHand2 = PokerHand.new(cards2)
            poker = Poker.new()
            expect(poker.rank2(pokerHand1, pokerHand2)).to eq 1
        end
        it "should double pair tie" do
            cards = [0,13,1,14,29].map{ |i|Card.new(i) }
            pokerHand = PokerHand.new(cards)
            poker = Poker.new()
            expect(poker.rank2(pokerHand, pokerHand)).to eq 0
        end

        #### TODO: test for the comparison
    end
end