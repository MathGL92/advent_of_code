input = File.open("/Users/mathieulonge/code/MathGL92/advent_of_code/day_10/input.txt").read

example = File.open("/Users/mathieulonge/code/MathGL92/advent_of_code/day_10/example.txt").read

def result(input)
  array = input.split("\n").map(&:to_i).sort.unshift(0)
  array.push(array.last + 3)
  num_one = 0
  num_three = 0
  i = 1
  until i == array.size
    case array[i] - array[i-1]
    when 1 then num_one += 1
    when 3 then num_three += 1
    end
    i += 1
  end
  num_one * num_three
  # p num_one, num_three
end


p result(input)
