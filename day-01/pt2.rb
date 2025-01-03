a = []
b = Hash.new(0)

File.readlines('input')
    .map(&:strip)
    .each do |line|
        first, second = line.split(/\s+/).map(&:to_i)
        a << first
        b[second] += 1
    end

sum = a.sum {|element| element * b[element] } 

puts sum
