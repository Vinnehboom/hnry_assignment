# frozen_string_literal: true

require_relative '../spec_helper'
require_relative '../../app/classes/earner'

RSpec.describe Earner do
  let(:earner) { Earner.new(name: 'Henry', gross_income: 20.000) }

  describe '#gross_income' do
    subject { earner.gross_income }

    it { is_expected.to eq(20.000) }
  end

  describe '#name' do
    subject { earner.name }

    it { is_expected.to eq('Henry') }
  end
end
