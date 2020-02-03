require 'hand'

class PokerHand < Hand
    include Comparable
    ### TODO cards max 5 to check

    @@rankerHelper = {1 => "High Card", 2 => "Pair", 3 => "Double Pair",
     4 => "Three of a Kind", 5 => "Straight", 6 => "Flush", 7 => "Full House",
     8 => "Four of a Kind", 9 => "StraightFlush"}
    

    def isHighCard?
        ! (isPair? || isDoublePair? || isThreeOfAKind? || 
        isStraight? || isFlush? || isFullHouse? || 
        isFourOfAKind? || isStraightFlush?)
    end

    def isPair?
        @cards.group_by{|c| c.value}.transform_values{ |v| v.size == 2? 1 : 0 }.values.sum == 1
    end

    def extractPairValue(size)
        @cards.group_by{|c| c.value}.map{ |k, v| v.size == size ? k : 0 }
    end

    # def extractThreeValue
    #     @cards.group_by{|c| c.value}.map{ |k, v| v.size == 3? k : 0 }
    # end

    def isDoublePair?
        @cards.group_by{|c| c.value}.transform_values{ |v| v.size == 2? 1 : 0 }.values.sum == 2
    end

    def isThreeOfAKind?
        @cards.group_by{|c| c.value}.transform_values{ |v| v.size == 3? 1 : 0 }.values.sum == 1
    end

    def isStraight? 
        cs = @cards.sort
        s = true
        pc = cs.shift
        for c in cs do
            if pc.value + 1 != c.value
                s = false
                break
            else
                pc = c
            end
        end

        s
    end

    def isFlush?
        @cards.group_by{|c| c.suit}.transform_values{ |v| v.size == 5? 1 : 0 }.values.sum == 1
    end

    def isFullHouse?
        isPair? && isThreeOfAKind?
    end

    def isFourOfAKind?
        @cards.group_by{|c| c.value}.transform_values{ |v| v.size == 4? 1 : 0 }.values.sum == 1
    end

    def isStraightFlush?
        isStraight? && isFlush?
    end

    def rank()
        if isStraightFlush?
            9
        elsif isFourOfAKind?
            8
        elsif isFullHouse?
            7
        elsif isFlush?
            6
        elsif isStraight?
            5
        elsif isThreeOfAKind?
            4
        elsif isDoublePair?
            3
        elsif isPair?
            2
        else isHighCard?
            1
        end
    end

    def cmpCards(other)
        cs1 = self.cards.sort
        cs2 = other.cards.sort
        loop do
            c1 = cs1.shift
            c2 = cs2.shift
            if (c1 != c2) 
                return c1<=>c2
            elsif cs1.size == 0
                break
            end
        end    
        0    
    end

    def cmpPairs(other, size)
        cv1 = self.extractPairValue(size)
        cv2 = other.extractPairValue(size)
        if (cv1 == cv2)
            cmpCards(other)
        else
            cv1 <=> cv2
        end
    end

    def <=>(other)
        ser = self.rank()
        otr = other.rank()
        if ser == otr
            case ser
            when 8
                cmpPairs(other, 4)
            when 5,9
                self.cards.max <=> other.cards.max
            when 4,7
                cmpPairs(other, 3)
            when 2,3
                cmpPairs(other, 2)
            when 1,6
                cmpCards(other)
            else raise Exception("???")
            end            
        else
            ser <=> otr
        end
    end
end