input = File.open("/Users/mathieulonge/code/MathGL92/advent_of_code/day_4/input.txt").read

def passport_processing(string)
  passports_array = string.split("\n\n").map { |passport| passport.gsub("\n", ' ') }.map { |passport| passport.split(' ') }.map do |passport|
      passport.map { |field| field.split(':') }.to_h
  end
  # iterate through passports array
  passports_array.select do |passport|
    # select hash that include all keys
    %w[byr iyr eyr hgt hcl ecl pid].all? {|s| passport.key? s}
    # count size of array
  end.size
end

# def passport_processing(string)
#   passports_array = string.split("\n\n").map { |passport| passport.gsub("\n", ' ') }.first.scan(/(.+):(.+)\s/).to_h
# end

p passport_processing(input)
