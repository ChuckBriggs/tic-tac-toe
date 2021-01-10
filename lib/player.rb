# frozen_string_literal: true
#require 'pry'; binding.pry #rubocop:disable all

# asdf class init comment
class Player
  attr_reader :symbol

  def initialize(char)
    @symbol = char
  end
end
