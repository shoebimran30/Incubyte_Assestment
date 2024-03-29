module StringCalculator
  def self.add(input)
    delimiter = parse_delimiter(input)
    numbers = parse_numbers(input, delimiter)
    check_negatives(numbers)
    numbers.reject! { |num| num > 1000 }
    numbers.sum
  end

  def self.parse_delimiter(input)
    if input.start_with?("//")
      extract_custom_delimiters(input)
    else
      [',', "\n"]
    end
  end

  def self.extract_custom_delimiters(input)
    delimiter_part = input.match(/\/\/(.*?)\n/)[1]
    delimiter_part.split(/[\[\]]+/).reject(&:empty?)
  end

  def self.parse_numbers(input, delimiter)
    numbers = input
    replace_delimiters(numbers, delimiter)
    numbers.split(',').map(&:to_i)
  end

  def self.replace_delimiters(numbers, delimiter)
    delimiter.each { |d| numbers.gsub!(d, ',') }
  end

  def self.check_negatives(numbers)
    negatives = numbers.select { |num| num < 0 }
    raise "negatives not allowed: #{negatives.join(',')}" if negatives.any?
  end
end
