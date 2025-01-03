a = []
b = []
sum = 0

File.readlines('input')
    .map(&:strip)
    .each do |line|
        first, second = line.split(/\s+/).map(&:to_i)
        a << first
        b << second
    end

a.sort!
b.sort!

a.zip(b).each { |first, second| 
    difference = first - second
    difference = difference.abs 
    sum += difference
}

puts sum