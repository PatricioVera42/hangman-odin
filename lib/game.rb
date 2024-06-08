
def random_word_selector(word_array)
  return word_array[rand(0..word_array.length)]
end

class Game

  attr_accessor :word

  def initialize(word_array)
    @word = random_word_selector(word_array)
    @correct_guess = Array.new(@word.length,"/")
    @guessed_letters = []
    @attemps = 0
  end

  def show_guess
    puts @guess
  end

  def valid_guess?(guess)
    guess.between?('a','z') && guess.length == 1 
  end

  def checkletter?(guess)
    @guessed_letters.include?(guess)
  end

  def add_letter(guess)
    if !valid_guess?(guess)
      puts "Thats not a valid guess, insert a single letter please"
    elsif checkletter?(guess)
      puts "You've already guessed that letter, insert a new one"
    else
      @guessed_letters.push(guess)
      if @word.include?(guess)
        @word.split("").each_with_index do |element, index|
          if element == guess
            @correct_guess[index] = guess
          end
        end
      end
    end  
  end

  def play_game
    10.times do 
      puts
      @attemps += 1
      puts 'Select your guess: '
      guess = gets.chomp.downcase
      add_letter(guess)
      if @word == @correct_guess.join
        puts "You have guessed the word, it was #{@correct_guess.join}"
        return
      else
        puts "Your word so far:  #{@correct_guess.join}"
        puts "All the letters you've guessed:  #{@guessed_letters.join("")}"
        puts "You still have #{10 - @attemps} attemps"
      end
    end
    puts 
    puts "You have lost, the correct word was #{@word}"
  end
end

