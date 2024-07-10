# frozen_string_literal: true

class TaxCalculator
  def initialize(tax_rules: [])
    @tax_rules = tax_rules
  end

  def yearly_tax_rate(earner:)
    income = gross_income(earner:)
    @tax_rules.sum { |tax_rule| tax_rule.apply(income:) }
  end

  private

  def gross_income(earner:)
    earner.gross_income
  end
end
