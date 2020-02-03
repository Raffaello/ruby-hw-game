require "card"

describe Card do
    context "Initialze a Card" do
        it "Should return 2C when 0" do
            card = Card.new(0)
            expect(card.value).to eq 0
            expect(card.suit).to eq 0
            expect(card.to_str).to eq "2C"
        end
        it "Should return QS when 49" do
            card = Card.new(49)
            expect(card.value).to eq 10
            expect(card.suit).to eq 3
            expect(card.to_str).to eq "QS"
        end
        it "Should return 6H when 30" do
            card = Card.new(30)
            expect(card.value).to eq 4
            expect(card.suit).to eq 2
            expect(card.to_str).to eq "6H"
        end
    end
    context "Card comparison" do
        it "should return true (rule A)" do
            expect(Card.new(12) > Card.new(13)).to eq true
            expect(Card.new(50) < Card.new(12)).to eq true
            expect(Card.new(30) == Card.new(4)).to eq true
        end
    end
end
