a = []
b = []

File.readlines('input')
    .map(&:strip)
    .each do |line|
        first, second = line.split(/\s+/).map(&:to_i)
        a << first
        b << second
    end

a.sort!
b.sort!

sum = a.zip(b).sum { |first, second| 
    (first - second).abs 
}

puts sum
