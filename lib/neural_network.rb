require "matrix"

class NeuralNetwork
  attr_reader :num_nodes, :weights

  def initialize(num_nodes, weights)
    @num_nodes = num_nodes
    @weights = weights
  end

  def forward_pass(x)
    weights.reduce(x) do |inputs, one_layer_weights|
      inputs * one_layer_weights
    end
  end
end
