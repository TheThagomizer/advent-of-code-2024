total = File.readlines('input')
    .map(&:strip)
    .count do |line|
      row = line.split(/\s+/).map(&:to_i)
      comparisons = row.each_cons(2).map { |first, second|
        if (first - second).abs > 3
          0
        else
          first <=> second
        end
        }.uniq!
        comparisons.length == 1 && comparisons[0] != 0
      end

puts "Answer = #{total}"
