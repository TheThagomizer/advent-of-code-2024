total = File.readlines('test-input')
    .map(&:strip)
    .count do |line|
      report = line.split(" ").map(&:to_i)
      report_array = report.each_index.any? { |i| 
        array = report[...i] + report[i+1..]
        comparisons = array.each_cons(2).map { |first, second|
          if (first - second).abs > 3
            0
          else
            first <=> second
          end
          }.uniq
          comparisons.length == 1 && comparisons[0] != 0
      }
      end

puts "Answer = #{total}"
