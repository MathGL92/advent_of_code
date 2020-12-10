require 'pry'
input = File.open("/Users/mathieulonge/code/MathGL92/advent_of_code/day_10/input.txt").read

example = File.open("/Users/mathieulonge/code/MathGL92/advent_of_code/day_10/example.txt").read

def result(input)
  data = input.split("\n").map(&:to_i)
  array = [0, *data.sort, data.max + 3]
  array.each_cons(2).map { |a,b| b - a }.tally.values.inject(:*)
  ways = [0] * array.size

  ways[0] = 1

  for i in (1...array.size) do
    for j in (1..3) do
      if i - j >= 0
        if array[i] - array[i - j] <= 3
          ways[i] += ways[i - j]
        end
      end
    end
  end
  ways.last
end


p result(input)
