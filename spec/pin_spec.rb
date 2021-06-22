# frozen_string_literal: true

# create your sample spec in the root/spec dir
require 'spec_helper'
require_relative '../pin'

describe 'pin' do
  let(:f) { Pin.new }
  let(:answer) { `echo {1,2,4}{3,2,6}{5,2,4,6,8}{7,4,8}`.split }

  context 'Standard - Given When Then' do
    it 'returns expected pin sequence' do
      expect(answer).to eq(get_pins('1357'))
    end
  end
end
