# frozen_string_literal: true

require 'pry'
def get_pins(observed)
  digits = observed.split('').map(&:to_i)
  neighbors = (0..9).to_a
                    .zip([[0, 8], [1, 2, 4], [2, 1, 3, 5], [3, 2, 6], [4, 1, 5, 7],
                          [5, 2, 4, 6, 8], [6, 3, 5, 9], [7, 4, 8], [8, 0, 5, 7, 9], [9, 6, 8]])
                    .to_h
  digit_neighbors = digits.map { |d| neighbors[d] }
  digit_neighbors[0].product(*digit_neighbors[1..]).map(&:join)
end
