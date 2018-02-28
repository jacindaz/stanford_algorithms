require 'pry'
require 'awesome_print'

# compute the number of inversions in the file
# implement using the fast divide and conquer algo
def find_inversions(array, inversions_count)
  # 2) count the # of inversions per sub-array
  # 3) sort each sub-array as we are counting inversions

  # recursion base case
  return inversions_count if array.length == 1

  # puts "\n============="
  # puts "array: #{array}, inversions_count: #{inversions_count}"

  max_index = array.length - 1
  sorted_array = []

  first_item = array[0]
  array[1..-1].each_with_index do |second_item, index|
    break if index == max_index

    if first_item > second_item
      inversions_count += 1
      # puts "found an inversion! first_item: #{first_item}, second_item: #{second_item}"
      # puts "new inversion_count: #{inversions_count}"
    else
      # puts "no inversion, first_item: #{first_item}, second_item: #{second_item}"
      # puts "new inversion_count: #{inversions_count}"
    end
  end

  # puts "array[1..-1]: #{array[1..-1]}, new inversions_count: #{inversions_count}"
  # puts "=============\n\n"

  # puts "final inversions count: #{inversions_count}"
  find_inversions(array[1..-1], inversions_count)
end

def divide_and_conquer(file_path)
  # read the integerarray.txt file
  line_number = 0
  total_inversions = 0
  results = {}

  IO.foreach(file_path) do |line|
    line_number += 1
    # next if line_number % 2 == 0
    # next if line_number % 3 == 0
    # next if line_number % 5 == 0
    # next if line_number % 7 == 0

    # 1) split each number into 2 sub-arrays
    line = line.strip
    array1 = line[0...line.length/2].to_s.split('').map(&:to_i)
    array2 = line[line.length/2..-1].to_s.split('').map(&:to_i)

    # puts "line: #{line} \t\tarray1: #{array1} \t\tarray2: #{array2}"

    # array1_inversions = find_inversions(array1, 0)
    # puts "array1_inversions: #{array1_inversions}"

    # array2_inversions = find_inversions(array2, 0)
    # puts "array2_inversions: #{array2_inversions}\n\n"

    entire_line = line.to_s.split('').map(&:to_i)
    num_inversions = find_inversions(entire_line, 0)
    total_inversions += num_inversions
    results[line.to_i] = num_inversions

    puts "num_inversions: #{num_inversions} \tnumber: #{entire_line}"
    # print "." if line_number % 1500 == 0

    # break if line_number == 10
  end

  puts "\ntotal inversions: #{total_inversions}"
  # total_inversions
  ap results
  results
end

# divide_and_conquer('/Users/jacinda/Documents/Programming/coursera_algorithms_class/week2/integerarray.txt')



def test_inversions(file_path)
  divide_and_conquer(file_path)
end

test_inversions('/Users/jacinda/Documents/Programming/coursera_algorithms_class/week2/test_integers.txt')
