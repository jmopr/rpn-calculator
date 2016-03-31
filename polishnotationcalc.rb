# RPN Calculator
# The calculator should use standard input and standard output, unless the language makes that impossible.
#
# It should implement the four standard arithmetic operators.
#
# It should support negative and decimal numbers, and should not have arbitrary limits on the number of operands.
# (That is, support any number of operations and numbers.)
#
# The calculator should not allow invalid or undefined behavior.
#
# The calculator should exit when it receives a q command or an end of input indicator.

def calculator
  puts "RPN Calculator"
  calc = []
  input = 0
  while input != 'q'
    operand = ['+','-','*','/']
    print '> '
    input = gets.chomp
    if validate?(input) || operand.include?(input)
      if operand.include?(input)
        operand2 = calc.pop.to_f
        operand1 = calc.pop.to_f
        calc << operate(operand1, operand2, input)
      else
        calc << input
      end
      puts calc.last
    end
  end
end

def validate?(input)
  Float(input) != nil rescue false
end

def operate(operand1, operand2, input)
  case input
  when '+'
    operand1 + operand2
  when '-'
    operand1 - operand2
  when '*'
    operand1 * operand2
  when '/'
    operand1 / operand2
  end
end

calculator
