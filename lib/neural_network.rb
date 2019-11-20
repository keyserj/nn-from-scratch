require "matrix"

class NeuralNetwork
  attr_reader :num_nodes, :weights

  def initialize(num_nodes, weights)
    @num_nodes = num_nodes
    @weights = weights
  end

  def forward_pass(x)
    x * weights
  end
end
