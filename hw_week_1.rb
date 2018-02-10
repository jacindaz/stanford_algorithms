# In this programming assignment you will implement one or more of the integer multiplication algorithms described in lecture.
# To get the most out of this assignment, your program should restrict itself to multiplying only pairs of single-digit numbers. You can implement the grade-school algorithm if you want, but to get the most out of the assignment you'll want to implement recursive integer multiplication and/or Karatsuba's algorithm.
#
# So: what's the product of the following two 64-digit numbers?
# 3141592653589793238462643383279502884197169399375105820974944592
# 2718281828459045235360287471352662497757247093699959574966967627
# [TIP: before submitting, first test the correctness of your program on some small test cases of your own devising. Then post your best test cases to the discussion forums to help your fellow students!]
# [Food for thought: the number of digits in each input number is a power of 2. Does this make your life easier? Does it depend on which algorithm you're implementing?]
# The numeric answer should be typed in the space below. So if your answer is 1198233847, then just type 1198233847 in the space provided without any space / commas / any other punctuation marks.
# (We do not require you to submit your code, so feel free to use any programming language you want --- just type the final numeric answer in the following space.)

# x * y =
#   10^n(a*c) + 10^(n/2)(ad + bc) + bd
# => n: (length of x or y) / 2
# => a: 1st half of 1st #
# => b: 2nd half of 1st #
# => c: 1st half of 2nd #
# => d: 2nd half of 2nd #

def karatsuba(x, y)
  midway_x = x.to_s.length/2
  x_array = x.to_s.split('')
  a = x_array[0...midway_x].join('').to_i
  b = x_array[midway_x...(x_array.length)].join('').to_i

  midway_y = y.to_s.length/2
  y_array = y.to_s.split('')
  c = y_array[0...midway_y].join('').to_i
  d = y_array[midway_y...(y_array.length)].join('').to_i

  puts "x: #{x}, a: #{a}, b: #{b}"
  puts "y: #{y}, c: #{c}, d: #{d}"

  n = midway_x * 2

  step1 = a * c
  step2 = b * d
  step3 = (a+b) * (c+d)
  step4 = step3 - step2 - step1
  step5 = (10**n * step1) + step2 + (step4 * 10**(n/2))

  puts "\nstep1: #{step1}"
  puts "step2: #{step2}"
  puts "step3: #{step3}"
  puts "step4: #{step4}"
  puts "\nstep5: #{step5}"
end


karatsuba(123456, 789012)
karatsuba(3141592653589793238462643383279502884197169399375105820974944592, 2718281828459045235360287471352662497757247093699959574966967627)
