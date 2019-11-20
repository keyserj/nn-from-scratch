RSpec.configure do |config|
  RSpec::Matchers.define :be_close_to_matrix do |expected_matrix|
    match do |actual_matrix|
      matrices_are_close?(actual_matrix, expected_matrix)
    end
  end
end

def matrices_are_close?(a, b)
  delta = 0.000001.freeze

  if a.nil? || b.nil?
    return false
  elsif a.column_count != b.column_count || a.row_count != b.row_count
    return false
  end

  a.each_with_index do |a_element, row, col|
    b_element = b[row, col]
    return false if (a_element - b_element).abs > delta
  end

  return true
end