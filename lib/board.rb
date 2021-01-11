# frozen_string_literal: true
#require 'pry'; binding.pry #rubocop:disable all

# asdf class init comment
class Board
  attr_reader :cells

  def initialize
    @cells = []
    9.times { @cells.push(' ') }
  end

  def self.draw(arr)
    puts "   1   2   3 \n     |   |   \nA  #{arr[0]} | #{arr[1]} | #{arr[2]} \
        \n  ___|___|___\n     |   |   \nB  #{arr[3]} | #{arr[4]} | #{arr[5]} \
        \n  ___|___|___\n     |   |   \nC  #{arr[6]} | #{arr[7]} | #{arr[8]} \
        \n     |   |   \n\n"
  end

  def full?
    if @cells.include?(' ')
      false
    else
      true
    end
  end
end
