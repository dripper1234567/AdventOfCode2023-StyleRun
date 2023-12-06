
i = 0
total = 0

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
