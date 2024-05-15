class Hangman
  @@lines 
  @@number_guess = 10
  @@str = ""
  @@random_line = ""
  def initialize
    @@lines = File.readlines('1000words.txt')
    
    while (@@random_line.length < 5 || @@random_line.length > 12) 
      @@random_line = @@lines.sample.chomp
    end
    for i in (1..@@random_line.length) 
      @@str << "*"
    end
  end
  
  def guess 

    @@number_guess -= 1
    puts ("Please guess a letter or the whole words. Type that letter or that word")
    choice = gets.chomp
    #puts (choice === @@random_line)
  
    if (choice.length == 1) 
      cnt = 0
      @@random_line.each_char.with_index do |x, id|
        if (x == choice) 
          @@str[id] = x
          cnt += 1
        end
      end
      puts ("You guess #{cnt} correct character")
      if (!@@str.include? ("*")) 
        puts ("You guess all letter of the word. The word is #{@@random_line}")
      else
        puts ("Current guessed word is #{@@str}")
      end

    elsif (choice == @@random_line) 
      puts ("You guess correct word. The word is #{@@random_line}")
      puts ("You win")
      exit
    else 
      puts ("You guess wrong word")

    end
  end
  def gameplay 
    while (true)
      if (@@number_guess <= 0) 
        puts ("You lose. The word is #{@@random_line}")
        break
      end
      guess
    end

  end
end

game = Hangman.new
game.gameplay