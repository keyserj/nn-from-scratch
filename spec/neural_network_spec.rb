require "./lib/neural_network.rb"
require "./spec/matrix_spec_helper.rb"

RSpec.describe NeuralNetwork do
  describe "forward_pass" do
    describe "calculates single layer" do
      context "with two-node layers" do
        let(:num_nodes) { [1, 2] }
        let(:weights) { [ Matrix[ [7, 0.9] ] ] }
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

      context "with three-node layers" do
        let(:num_nodes) { [1, 3] }
        let(:weights) { [ Matrix[ [7, 0.9, 2.2] ] ] }
        let(:nn) { NeuralNetwork.new(num_nodes, weights) }

        it "using simple example" do
          x = Vector[2.6]

          y_actual = nn.forward_pass(x)

          expect(y_actual).to be_close_to_matrix(Matrix[ [18.2, 2.34, 5.72] ])
        end
      end

      describe "calculates two layers" do
        let(:num_nodes) { [1, 3, 2] }
        let(:weights) { [ Matrix[ [7, 0.9, 2.2] ],
                          Matrix[ [1.8, 6.0],
                                  [7.2, 0.8],
                                  [8.9, 8.2], ], ] }
        let(:nn) { NeuralNetwork.new(num_nodes, weights) }

        it "using simple example" do
          x = Vector[2.6]

          y_actual = nn.forward_pass(x)

          expect(y_actual).to be_close_to_matrix(Matrix[ [100.516, 157.976] ])
        end
      end
    end
  end
end
