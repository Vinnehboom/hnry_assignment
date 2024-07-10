# frozen_string_literal: true

require_relative '../spec_helper'
require_relative '../../app/classes/earner'
require_relative '../../app/classes/income_tier_tax'
require_relative '../../app/services/tax_calculator'

RSpec.describe TaxCalculator do
  let(:tax_calculator) { described_class.new(tax_rules:) }

  describe '#yearly_tax_rate' do
    subject { tax_calculator.yearly_tax_rate(earner:) }
    let(:tax_rules) { nz_tax_rules }

    where(:income, :expected_taxes) do
      [
        [10_000, 1050],
        [35_000, 5145],
        [100_000, 23_920],
        [220_000, 65_920]
      ]
    end

    with_them do
      let(:earner) { Earner.new(name: 'henry', gross_income: income) }

      it { is_expected.to eq(expected_taxes) }
    end
  end
end

def nz_tax_rules
  [IncomeTierTax.new(minimum_income: 0, maximum_income: 14_000, tax_rate: 0.105),
   IncomeTierTax.new(minimum_income: 14_000, maximum_income: 48_000, tax_rate: 0.175),
   IncomeTierTax.new(minimum_income: 48_000, maximum_income: 70_000, tax_rate: 0.3),
   IncomeTierTax.new(minimum_income: 70_000, maximum_income: 180_000, tax_rate: 0.33),
   IncomeTierTax.new(minimum_income: 180_000, tax_rate: 0.39)]
end
