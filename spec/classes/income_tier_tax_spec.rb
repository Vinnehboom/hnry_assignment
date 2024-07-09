# frozen_string_literal: true

require_relative '../spec_helper'
require_relative '../../app/classes/income_tier_tax'

RSpec.describe IncomeTierTax do
  describe '#apply' do
    where(:minimum_income, :maximum_income, :tax_rate, :income, :expected_value) do
      [
        [0, 14_000, 0.105, 10_000, 1050],
        [14_000, 48_000, 0.2, 20_000, 1200],
        [35_000, 50_000, 0.3, 30_000, 0],
        [70_000, 180_000, 0.35, 71_000, 350],
        [180_000, nil, 0.39, 250_000, 27_300]
      ]
    end

    with_them do
      subject { described_class.new(minimum_income:, maximum_income:, tax_rate:).apply(income) }

      it { is_expected.to eq(expected_value) }
    end
  end
end
