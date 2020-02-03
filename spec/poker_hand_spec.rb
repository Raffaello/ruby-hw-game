require 'poker_hand'

describe PokerHand do
    context "Rank" do
        it "Should be High Card with deck [2C,3D,QH,4H,5H]" do
            cards = [0,14,36,28, 29].map{ |i|Card.new(i) } 
        
            pokerHand = PokerHand.new(cards)
                         
            expect(pokerHand.isHighCard?).to eq true
            expect(pokerHand.isPair?).to eq false
            expect(pokerHand.isDoublePair?).to eq false
            expect(pokerHand.isThreeOfAKind?).to eq false
            expect(pokerHand.isStraight?).to eq false
            expect(pokerHand.isFlush?).to eq false
            expect(pokerHand.isFourOfAKind?).to eq false
            expect(pokerHand.isStraightFlush?).to eq false
            
            expect(pokerHand.rank()).to eq 1
        end
        it "Should be Pair with deck [2C,2D,3D,QH,4H]" do
            cards = [0,13,14,36,28].map{ |i|Card.new(i) }
        
            pokerHand = PokerHand.new(cards)
            
            expect(pokerHand.isHighCard?).to eq false
            expect(pokerHand.isPair?).to eq true
            expect(pokerHand.isDoublePair?).to eq false
            expect(pokerHand.isThreeOfAKind?).to eq false
            expect(pokerHand.isStraight?).to eq false
            expect(pokerHand.isFlush?).to eq false
            expect(pokerHand.isFourOfAKind?).to eq false
            expect(pokerHand.isStraightFlush?).to eq false

            expect(pokerHand.rank()).to eq 2 #"Pair" # 2D,2C"
            
        end
        it "Should be Double Pair" do
            deck = Deck.new(0)
            pokerHand = deck.pickOneHand()
            
            expect(pokerHand.isHighCard?).to eq false
            expect(pokerHand.isPair?).to eq false
            expect(pokerHand.isDoublePair?).to eq true
            expect(pokerHand.isThreeOfAKind?).to eq false
            expect(pokerHand.isStraight?).to eq false
            expect(pokerHand.isFlush?).to eq false
            expect(pokerHand.isFourOfAKind?).to eq false
            expect(pokerHand.isStraightFlush?).to eq false

            expect(pokerHand.rank()).to eq 3 #"Double Pair"# KH,KC,4H,4C"
            
        end
        it "Should be Three of a kind  [2C,2D,2H,QH,4H]" do
            cards = [0,13,26,36,28].map{ |i|Card.new(i) }
            pokerHand = PokerHand.new(cards)
            
            expect(pokerHand.isHighCard?).to eq false
            expect(pokerHand.isPair?).to eq false
            expect(pokerHand.isDoublePair?).to eq false
            expect(pokerHand.isThreeOfAKind?).to eq true
            expect(pokerHand.isStraight?).to eq false
            expect(pokerHand.isFlush?).to eq false
            expect(pokerHand.isFourOfAKind?).to eq false
            expect(pokerHand.isStraightFlush?).to eq false
            
            expect(pokerHand.rank()).to eq 4 #"Three of a Kind"# 2H,2D,2C"
        end

        it "Should be straight [2C,3C,4C,5C,6D]" do
            cards = [0,1,2,3,4+13].map{ |i|Card.new(i) }
            pokerHand = PokerHand.new(cards)
            
            expect(pokerHand.isHighCard?).to eq false
            expect(pokerHand.isPair?).to eq false
            expect(pokerHand.isDoublePair?).to eq false
            expect(pokerHand.isThreeOfAKind?).to eq false
            expect(pokerHand.isStraight?).to eq true
            expect(pokerHand.isFlush?).to eq false
            expect(pokerHand.isFourOfAKind?).to eq false
            expect(pokerHand.isStraightFlush?).to eq false
            
            expect(pokerHand.rank()).to eq 5 #"Straight"# ???
        end

        it "Should be Flush [2C,3C,4C,5C,7C]" do
            cards = [0,1,2,3,5].map{ |i|Card.new(i) }
            pokerHand = PokerHand.new(cards)
            
            expect(pokerHand.isHighCard?).to eq false
            expect(pokerHand.isPair?).to eq false
            expect(pokerHand.isDoublePair?).to eq false
            expect(pokerHand.isThreeOfAKind?).to eq false
            expect(pokerHand.isStraight?).to eq false
            expect(pokerHand.isFlush?).to eq true
            expect(pokerHand.isFourOfAKind?).to eq false
            expect(pokerHand.isStraightFlush?).to eq false

            expect(pokerHand.rank()).to eq 6 # "Flush"# ???
        end

        it "Should be Full House [2C,2D,3C,3D,3H]" do
            cards = [0,13,1,14,27].map{ |i|Card.new(i) }
            pokerHand = PokerHand.new(cards)
            
            expect(pokerHand.isHighCard?).to eq false
            expect(pokerHand.isPair?).to eq true
            expect(pokerHand.isDoublePair?).to eq false
            expect(pokerHand.isThreeOfAKind?).to eq true
            expect(pokerHand.isStraight?).to eq false
            expect(pokerHand.isFlush?).to eq false
            expect(pokerHand.isFullHouse?).to eq true
            expect(pokerHand.isFourOfAKind?).to eq false
            expect(pokerHand.isStraightFlush?).to eq false
            
            expect(pokerHand.rank()).to eq 7 #"Full House"# ???
        end

        it "Should be 4 of a kind [2C,2D,2H,2S, 3C]" do
            cards = [0,13,26,39,1].map{ |i|Card.new(i) }
            pokerHand = PokerHand.new(cards)
            
            expect(pokerHand.isHighCard?).to eq false
            expect(pokerHand.isPair?).to eq false
            expect(pokerHand.isDoublePair?).to eq false
            expect(pokerHand.isThreeOfAKind?).to eq false
            expect(pokerHand.isStraight?).to eq false
            expect(pokerHand.isFlush?).to eq false
            expect(pokerHand.isFullHouse?).to eq false
            expect(pokerHand.isFourOfAKind?).to eq true
            expect(pokerHand.isStraightFlush?).to eq false

            expect(pokerHand.rank()).to eq 8 #"Four of a Kind"# ???
        end

        it "Should be StraightFlush [2C,3C,4C,5C,6C]" do
            cards = [0,1,2,3,4].map{ |i|Card.new(i) }
            pokerHand = PokerHand.new(cards)
            
            expect(pokerHand.isHighCard?).to eq false
            expect(pokerHand.isPair?).to eq false
            expect(pokerHand.isDoublePair?).to eq false
            expect(pokerHand.isThreeOfAKind?).to eq false
            expect(pokerHand.isStraight?).to eq true
            expect(pokerHand.isFlush?).to eq true
            expect(pokerHand.isFourOfAKind?).to eq false
            expect(pokerHand.isStraightFlush?).to eq true

            expect(pokerHand.rank()).to eq 9 #"StraightFlush"# ???
        end
    end
end
