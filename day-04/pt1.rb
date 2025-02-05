require "matrix"

grid = File.readlines("input").map(&:strip).map(&:chars)
matrix = Matrix[*grid]
total_valid_paths = 0

TARGET = ["X", "M", "A", "S"].freeze
MAX_J = matrix.row_count.freeze

dirs = ([-1, 0, 1].repeated_permutation(2).to_a - [[0,0]]).map { |dx, dy| Vector[dx, dy] }
matrix.each_with_index { |char, ri, ci| 
  next unless char == "X"
      pos = Vector[ri, ci]
      valid_paths = dirs.count { |dv|
        (1..3).all? { |i|
        next_pos = pos + (dv * i)
        next_pos.all? { |j| j >= 0 && j < MAX_J } && matrix[*next_pos] == TARGET[i]
        }
      }
      total_valid_paths += valid_paths
    }
puts total_valid_paths
