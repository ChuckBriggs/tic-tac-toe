# frozen_string_literal: true

#require 'pry'; binding.pry #rubocop:disable Layout/LeadingCommentSpace

module TicTacToe
  # asdf class init comment
  class Board
    attr_reader :cells

    def initialize
      @cells = []
      9.times { @cells.push(' ') }
    end

    def self.draw(arr)
      puts "Drawing #{arr}"
    end
  end
end
