class Product < ApplicationRecord
  def self.update_currency_conversion_rates
    uri = URI('https://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml')
    http_req = Net::HTTP.get(uri)
    response = Nokogiri::XML(http_req)
    data_hash = Hash.from_xml(response.to_s)
    latest_currency_rate_hash = data_hash["Envelope"]["Cube"]["Cube"].first
    hash_file = latest_currency_rate_hash
    File.write("#{Rails.root}/config/currency_rates.yml", hash_file.to_yaml)
    data = YAML.load_file("#{Rails.root}/config/currency_rates.yml")
    return data["Cube"]
  end

  def self.get_currency_data_arry
    is_data_exists = File.exists?("#{Rails.root}/config/currency_rates.yml")
    if is_data_exists.present?
      from_file = YAML.load_file("#{Rails.root}/config/currency_rates.yml")
      if from_file["time"].to_date == Date.today - 1
        file_data = YAML.load_file("#{Rails.root}/config/currency_rates.yml")["Cube"]
      else
        file_data = Product.update_currency_conversion_rates
      end
    else
      file_data = Product.update_currency_conversion_rates
    end
    return file_data
  end

  def self.get_selected_currency_price(type, data)
    e_rate = 0.0
    data.each do |currency_data|
      next if currency_data["currency"] != type
      e_rate += currency_data["rate"].to_f
    end
    e_rate
  end
end
