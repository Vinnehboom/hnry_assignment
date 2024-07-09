# frozen_string_literal: true

class Earner
  attr_accessor :name, :gross_income

  def initialize(name:, gross_income:)
    @name = name
    @gross_income = gross_income
  end
end
