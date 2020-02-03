class Card
    include Comparable
    @number
    attr_reader :value
    attr_reader :suit
    @@sutiHelper
    @@cardHelper

    def initialize(number)
        raise ArgumentError if(number < 0 || number > 51) 
        
        @number = number
        @@suitHelper = { 0 => 'C', 1 => 'D', 2 => 'H', 3 => 'S' }
        @@cardHelper = { 0 => '2', 1 => '3', 2 => '4', 3 => '5', 4 => '6', 5 => '7', 6 => '8', 7 => '9', 8 => 'T', 9 => 'J', 10 => 'Q', 11 => 'K', 12 => 'A'}
        @value = number % 13
        @suit = number / 13
    end
    def to_str
        "#{@@cardHelper[value]}#{@@suitHelper[suit]}"
    end
    def <=> (other)
        self.value <=> other.value
    end
end