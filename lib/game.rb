# frozen_string_literal: true
#require 'pry'; binding.pry #rubocop:disable all

require_relative 'board'
require_relative 'player'

# asdf class init comment
class Game
  def initialize
    puts "\nInstructions: On your turn, enter the coordinate (e.g., \"b3\") of an empty \
          \n              cell. Three in a row wins.\n\n"
    @turn = 0
    @player = [Player.new('X'), Player.new('O')]
    @board = Board.new
    new_turn
  end

  def new_turn
    i = @turn % 2
    selected_cell = false
    until selected_cell
      Board.draw(@board.cells)
      puts "#{@player[i].symbol}'s turn. Select an empty cell:"
      selected_cell = gets.chomp.downcase
      selected_cell = translate_cell(selected_cell)
      if selected_cell
        if @board.cells[selected_cell] == ' '
          @board.cells[selected_cell] = @player[i].symbol
        else
          selected_cell = false
          puts 'Cell already occupied.'
        end
      end
    end
    if winner?(@player[i].symbol, @board.cells)
      Board.draw(@board.cells)
      puts "#{@player[i].symbol} wins!!!"
    elsif @board.full?
      Board.draw(@board.cells)
      puts 'You both lose.'
    else
      @turn += 1
      new_turn
    end
  end

  def winner?(char, arr)
    if (char == arr[0] && char == arr[1] && char == arr[2]) ||
       (char == arr[3] && char == arr[4] && char == arr[5]) ||
       (char == arr[6] && char == arr[7] && char == arr[8]) ||
       (char == arr[0] && char == arr[3] && char == arr[6]) ||
       (char == arr[1] && char == arr[4] && char == arr[7]) ||
       (char == arr[2] && char == arr[5] && char == arr[8]) ||
       (char == arr[0] && char == arr[4] && char == arr[8]) ||
       (char == arr[2] && char == arr[4] && char == arr[6])
      return true
    else
      return false
    end
  end

  def translate_cell(str)
    case str
    when 'a1'
      0
    when 'a2'
      3
    when 'a3'
      6
    when 'b1'
      1
    when 'b2'
      4
    when 'b3'
      7
    when 'c1'
      2
    when 'c2'
      5
    when 'c3'
      8
    else
      puts 'Invalid entry.'
      false
    end
  end
end
