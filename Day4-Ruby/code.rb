
i = 0

File.foreach("values.txt") do |line|
  i += 1
  puts i
  puts line
end
