state = true

total = File.readlines('input')
  .map(&:strip)
  .sum do |line|
    line.scan(/mul\((\d{1,3}),(\d{1,3})\)|(don't\(\)|do\(\))/).sum { |a, b, toggle|
      if toggle != nil
        if toggle == "do()"
          state = true
        elsif toggle == "don't()"
          state = false
        end
        next 0
      end
      if state == true
        a.to_i * b.to_i
      elsif state == false
        0
      end
    }
  end

puts total
