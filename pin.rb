# frozen_string_literal: true

require 'fileutils'
require 'pry'

# From `The observed PIN` Kata from codewars.com
class Pin
  def initialize
    @board = ('0'..'9')
             .to_a.zip([%w[0 8], %w[1 2 4], %w[2 1 3 5], %w[3 2 6], %w[4 1 5 7],
                        %w[5 2 4 6 8], %w[6 3 5 9], %w[7 4 8], %w[8 0 5 7 9],
                        %w[9 6 8]]).to_h
  end

#  private # removed for testing

  def pins(str)
    variations = str.split('').map { |c| @board[c] }
    return variations.first if str.length <= 1

    position, *positions = *(-str.length..-1).to_a
    positions.inject(variations[position]) do |result, index|
      result.product(variations[index])
    end.map(&:flatten).map(&:join)
  end
end

def get_pins(observed)
  Pin.new.pins(observed)
end
