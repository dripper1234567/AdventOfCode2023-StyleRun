
i = 0
total = 0

/
Specifically, you win copies of the scratchcards below the winning card equal to the number of matches.
So, if card 10 were to have 5 matching numbers, you would win one copy each of cards 11, 12, 13, 14, and 15.

Copies of scratchcards are scored like normal scratchcards and have the same card number as the card they copied.
So, if you win a copy of card 10 and it has 5 matching numbers,
it would then win a copy of the same cards that the original card 10 won:
cards 11, 12, 13, 14, and 15. This process repeats until none of the copies cause you to win any more cards.
(Cards will never make you copy a card past the end of the table.)
/

File.foreach("values.txt") do |line|
  # remove Game number
  data = line.split(': ')[1]
  # remove extra spaces
  data.gsub! "  ", ' '
  # split on whitespace
  data = data.split(" | ")

  # split up the winnning numbers and the given numbers
  win = data[0].split
  user = data[1].split

  card = 0

  for num in win
    if user.include? num
      if card == 0
        card = 1
      elsif card == 1
        card = 2
      else
        card *= 2
      end
    end
  end

  total += card
  puts total
end
