require 'csv'
require_relative 'game'

document_lines = File.readlines('google-10000-english-no-swears.txt')
word_array = Array.new


document_lines.each do |word|
  if word.strip.length.between?(5,12)
    word_array.push(word.strip)
  end
end

game = Game.new(word_array)
puts game.word
game.play_game


