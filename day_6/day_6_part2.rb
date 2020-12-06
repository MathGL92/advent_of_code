input = File.open("/Users/mathieulonge/code/MathGL92/advent_of_code/day_6/input.txt").read

def count_yes(string)
  string.split("\n\n").map { |group| group.gsub("\n", '') }.map { |group| group.chars }.map { |group| group.uniq }.map { |group| group.length }.sum
end

p count_yes(input)
