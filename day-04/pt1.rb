require "matrix"

grid = File.readlines("test-input").map(&:strip).map(&:chars)
matrix = Matrix[*grid]
