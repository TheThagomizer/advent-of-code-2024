require "matrix"
require "pry-byebug"
require "pry-rescue"
require "pry-stack_explorer"

grid = File.readlines("test-input").map(&:strip).map(&:chars)
matrix = Matrix[*grid]

MAX_SIZE = matrix.row_count.freeze
TARGET = ["M", "A", "S"].freeze

dirs = [
  Vector[-1, 1],
  Vector[1, 1],
  Vector[-1, -1],
  Vector[1, -1],
]

total = matrix.each_with_index.count {|char, ri, ci|
  next unless char == "A"
  pos = Vector[ri, ci]
  dirs.count {|dv|
    (-1..1).all? { |i|
      next_pos = pos + (dv * i)
      next_pos.all? { |j| 
        j >=0 && j < MAX_SIZE
      } && matrix[*next_pos] == TARGET[i+1]
    }  
  } == 2
}

puts total.inspect
