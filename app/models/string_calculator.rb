class StringCalculator < ApplicationRecord
  
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = ','
    num_list = numbers.split(delimiter)

    result_array = num_list.flat_map do |element|
      element.split('"').flat_map do |part|
        part.split(/\\n|;/)
      end.map(&:to_i)
    end
    handle_negatives(result_array)
    result_array.sum
  end

  def self.handle_negatives(numbers_array)
    negatives = numbers_array.select { |num| num.negative? }
    raise "Negative numbers not allowed: #{negatives.join(',')}" if negatives.any?
  end
end
