require "pry-byebug"
require "pry-rescue"
require "pry-stack_explorer"

ordering_rules = Hash.new { |hash, key| hash[key] = [] }
File.readlines("test-page-ordering-rules")
  .map(&:strip)
  .each do |line| 
    first, second = line.split("|")
    ordering_rules[second] << first
  end

sum = File.readlines("test-pages-to-produce")
  .map(&:strip)
  .sum do |line|
    array = line.split(",")
  end

puts sum.inspect
