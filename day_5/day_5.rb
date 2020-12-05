
require 'pry'

input = File.open("/Users/mathieulonge/code/MathGL92/advent_of_code/day_5/input.txt").read

# FBFBBFFRLR : 44 5 357
def calculate_id(seat)
  first_row = 0
  last_row = 127
  rows = (first_row..last_row).to_a
  i = 0
  until rows.size == 1
    mid_row = first_row + ((last_row - first_row) / 2)
    if seat[i] == "F"
      last_row = mid_row
    elsif seat[i] == "B"
      first_row = mid_row + 1
    end
    rows = (first_row..last_row).to_a
    i += 1
  end
  rows
  # find the column
  first_col = 0
  last_col = 7
  cols = (first_col..last_col).to_a
  i = 7
  until cols.size == 1
    mid_col = first_col + ((last_col - first_col) / 2)
    if seat[i] == "L"
      last_col = mid_col
    elsif seat[i] == "R"
      first_col = mid_col + 1
    end
    cols = (first_col..last_col).to_a
    i += 1
  end
  cols
  # calculate the seat id
  rows.first * 8 + cols.first
end

def highest_id_boarding_pass(input)
  array_seats = input.split("\n")
  array_seats.map {|seat| calculate_id(seat) }.sort
end

p highest_id_boarding_pass(input)
