# frozen_string_literal: true

# Alternatively use #!/usr/bin/env ruby & cmdline.rb
require 'fileutils'
require 'pry'

# Description:
# Alright, detective, one of our colleagues successfully observed our target person, Robby the robber. We followed him to a secret warehouse, where we assume to find all the stolen stuff. The door to this warehouse is secured by an electronic combination lock. Unfortunately our spy isn't sure about the PIN he saw, when Robby entered it.

# The keypad has the following layout:

# ┌───┬───┬───┐
# │ 1 │ 2 │ 3 │
# ├───┼───┼───┤
# │ 4 │ 5 │ 6 │
# ├───┼───┼───┤
# │ 7 │ 8 │ 9 │
# └───┼───┼───┘
#     │ 0 │
#     └───┘
# He noted the PIN 1357, but he also said, it is possible that each of the digits he saw could actually be another adjacent digit (horizontally or vertically, but not diagonally). E.g. instead of the 1 it could also be the 2 or 4. And instead of the 5 it could also be the 2, 4, 6 or 8.

# He also mentioned, he knows this kind of locks. You can enter an unlimited amount of wrong PINs, they never finally lock the system or sound the alarm. That's why we can try out all possible (*) variations.

# * possible in sense of: the observed PIN itself and all variations considering the adjacent digits

# Can you help us to find all those variations? It would be nice to have a function, that returns an array (or a list in Java and C#) of all variations for an observed PIN with a length of 1 to 8 digits. We could name the function getPINs (get_pins in python, GetPINs in C#). But please note that all PINs, the observed one and also the results, must be strings, because of potentially leading '0's. We already prepared some test cases for you.

# Detective, we are counting on you!

# For C# user: Do not use Mono. Mono is too slower when run your code.

# Auto generated Code from Dash rspec.init v 0.0.12 written by Charles M Magid - generated at 11:49 AM on Jun 21, 2021
class Pin
  def initialize
    @board = ('0'..'9').to_a.zip([%w[0 8], %w[1 2 4], %w[2 1 3 5],
                                  %w[3 2 6], %w[4 1 5 7], %w[5 2 4 6 8],
                                  %w[6 3 5 9], %w[7 4 8], %w[8 0 5 7 9],
                                  %w[9 6 8]]).to_h
  end

  # Example indicies: [-4, -3, -2, -1]
  # head: -4
  # tail: [-3, -2, -1]
  def pins(str)
    vars = variations(str)
    return vars[0] if str.length <= 1

    head, *tail = *(-str.length..-1).to_a
    res = vars[head]
    tail.each { |i| res = res.product(vars[i]) }
    res.map(&:flatten).map(&:join)
  end

  def variations(string)
    string.split('').map { |c| @board[c] }
  end
end
