module HomeHelper

  def currency_codes
    currency_types = get_currency_types_arry
    currencies = []
    Money::Currency.table.values.each do |currency|
      next if !currency_types.include?(currency[:iso_code])
      currencies += [[currency[:name] + ' (' + currency[:iso_code] + ')', currency[:iso_code]]]
    end
    currencies = [["Euro (EUR)", "EUR"]] + currencies
  end

  def get_currency_types_arry
    currency_types = []
    data_arry = Product.get_currency_data_arry
    data_arry.each do |data|
      currency_types << data["currency"]
    end
    currency_types
  end
end
