input = File.open("/Users/mathieulonge/code/MathGL92/advent_of_code/day_4/input.txt").read

def passport_processing(string)
  # height_format
  height_format = /(^(59|6[0-9]|7[0-6])in$)|(^(1[5-8][0-9]|19[0-3])cm$)/
  # hair_color_format
  hair_color_format = /^#[a-z0-9]{6}$/
  # eye_color_format
  eye_color_format = %w[amb blu brn gry grn hzl oth]
  # passport_id_format
  passport_id_format = /^\d{9}$/

  passports_array = string.split("\n\n").map { |passport| passport.gsub("\n", ' ') }.map { |passport| passport.split(' ') }.map do |passport|
    passport.map { |i| i.split ':' }.to_h
  end
  # iterate through passports array
  passports_array.select do |passport|
    # select hash that include all keys
    %w[byr iyr eyr hgt hcl ecl pid].all? {|s| passport.key? s} && passport["byr"].to_i.between?(1920, 2002) && passport["iyr"].to_i.between?(2010, 2020) && passport["eyr"].to_i.between?(2020, 2030) && height_format.match(passport["hgt"]) && hair_color_format.match(passport["hcl"]) && eye_color_format.include?(passport["ecl"]) && passport_id_format.match(passport["pid"])
    # count size of array
  end.size
end

# def passport_processing(string)
#   passports_array = string.split("\n\n").map { |passport| passport.gsub("\n", ' ') }.first.scan(/(.+):(.+)\s/).to_h
# end

p passport_processing(input)
