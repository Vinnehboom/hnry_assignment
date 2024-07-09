# frozen_string_literal: true

class IncomeTierTax
  def initialize(minimum_income:, tax_rate:, maximum_income: nil)
    @minimum_income = minimum_income
    @maximum_income = maximum_income
    @tax_rate = tax_rate
  end

  def apply(income:)
    return 0 unless income >= @minimum_income

    taxable_income(income:) * @tax_rate
  end

  private

  def taxable_income(income:)
    @maximum_income && @maximum_income < income ? @maximum_income - @minimum_income : income - @minimum_income
  end
end
