# Info

to represent a deck of 52 cards, 13 values and 4 suits, it is enough to use a number between 0 and 51

0-12 => 2..ACE of Clubs
13-25 => "      " Diamonds
26-38 => "      " Hearts
39-51 => "      " Spades

the extration is done then by modulo operations eg:

30 => 30/13 = 2 (Hearts), 30 % 13 = 4 => 6H

NOTE: there is an offset of +2 to compute the value and is due because the first card is a 2 starting at 0, consequently....
      mapped through an hash  would simplify the math (or just add  + 2 at the value.)

## Radom seed

it could be passed a random seed when init, by default is just zero to be reproducible.

## Consideration

- there could be some optimization, but not considered at first.
- in a OOD could be generalized but not required at the 1st iteration.
