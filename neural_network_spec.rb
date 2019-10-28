require "./neural_network.rb"
require "./matrix_spec_helper.rb"

RSpec.describe NeuralNetwork do
  context "forward_pass" do
    context "calculates single layer" do
      let(:num_nodes) { [1, 2] }
      let(:weights) { Matrix[ [7, 0.9] ] }
      let(:nn) { NeuralNetwork.new(num_nodes, weights) }

      it "using simple example #1" do
        x = Vector[1]

        y_actual = nn.forward_pass(x)

        expect(y_actual).to be_close_to_matrix(Matrix[ [7, 0.9] ])
      end

      it "using simple example #2" do
        x = Vector[2.6]

        y_actual = nn.forward_pass(x)

        expect(y_actual).to be_close_to_matrix(Matrix[ [18.2, 2.34] ])
      end
    end
  end
end
