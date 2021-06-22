# frozen_string_literal: true

# create your sample spec in the root/spec dir
require 'spec_helper'
require_relative '../pin'

describe 'pin' do
  let(:f) { Pin.new }
  let(:answer) { `echo {1,2,4}{3,2,6}{5,2,4,6,8}{7,4,8}`.split }
  let(:expected1) { [%w[1 2 4]] }
  let(:expected10) { [%w[1 2 4], %w[0 8]] }
  let(:expected1357) do
    [%w[1 2 4],
     %w[3 2 6],
     %w[5 2 4 6 8],
     %w[7 4 8]]
  end
  context 'Standard - Given When Then' do
    it 'returns expected pin sequence' do
      expect(answer).to eq(f.pins('1357'))
    end
  end

  context 'variations for each number in a string of numbers' do
    it 'finds single variations' do
      # expect(Calculator.new.add(1, 2)).to eq(3)
      # line_reasons['something'].should be_false
      expect(expected1).to eq(f.variations('1'))
      expect(expected10).to eq(f.variations('10'))
      expect(expected1357).to eq(f.variations('1357'))
    end
  end
end
