input = File.open("/Users/mathieulonge/code/MathGL92/advent_of_code/day_6/input.txt").read

example = File.open("/Users/mathieulonge/code/MathGL92/advent_of_code/day_6/example.txt").read

def count_yes(string)
  groups = string.split("\n\n").map { |group| group.split("\n").map { |person| person.chars }.reduce { |a, b| a & b }.map(&:size) }.flatten.sum
  # for each group asnwers, keep the common ones


end

p count_yes(input)
