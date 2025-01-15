total = File.readlines('test-input')
    .map(&:strip)
      .sum { |line|
        line.scan(/mul\((\d{1,3}),(\d{1,3})\)/) { |a, b| a.to_i * b.to_i }
      }
      
puts total.inspect
