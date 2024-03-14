module StringCalculator
  def self.add(input)
    delimiter = [',', "\n"]
    numbers = input.split(/#{delimiter.join('|')}/).map(&:to_i)
    numbers.sum
  end
end
